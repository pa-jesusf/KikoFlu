import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:kikoeru_flutter/src/services/download_path_service.dart';
import 'package:path/path.dart' as p;

void main() {
  late Directory root;

  setUp(() async {
    root = await Directory.systemTemp.createTemp('kikoflu_migration_');
  });

  tearDown(() async {
    if (await root.exists()) {
      await Process.run('chmod', ['-R', 'u+rwx', root.path]);
      await root.delete(recursive: true);
    }
  });

  Future<File> writeFile(String relative, String content) async {
    final file = File(p.join(root.path, relative));
    await file.parent.create(recursive: true);
    return file.writeAsString(content);
  }

  test('moves work folders and removes the originals', () async {
    await writeFile('old/RJ01234567/01.mp3', 'a');
    await writeFile('old/RJ01234567/sub/02.mp3', 'b');
    final oldDir = Directory(p.join(root.path, 'old'));
    final newDir = Directory(p.join(root.path, 'new'))..createSync();

    final result =
        await DownloadPathService.migrateFilesForTesting(oldDir, newDir);

    expect(result.success, isTrue);
    expect(result.errorCount, 0);
    expect(
      File(p.join(newDir.path, 'RJ01234567/sub/02.mp3')).readAsStringSync(),
      'b',
    );
    expect(Directory(p.join(oldDir.path, 'RJ01234567')).existsSync(), isFalse);
  }, skip: Platform.isWindows);

  test('keeps every original when a file cannot be copied', () async {
    await writeFile('old/RJ01234567/01.mp3', 'a');
    final unreadable = await writeFile('old/RJ07654321/02.mp3', 'b');
    await Process.run('chmod', ['000', unreadable.path]);
    final oldDir = Directory(p.join(root.path, 'old'));
    final newDir = Directory(p.join(root.path, 'new'))..createSync();

    final result =
        await DownloadPathService.migrateFilesForTesting(oldDir, newDir);

    expect(result.success, isFalse);
    expect(result.errorCount, greaterThan(0));
    expect(File(p.join(oldDir.path, 'RJ01234567/01.mp3')).existsSync(), isTrue);
    expect(File(unreadable.path).existsSync(), isTrue);
    // Partial copies made by this attempt are cleaned up.
    expect(Directory(p.join(newDir.path, 'RJ01234567')).existsSync(), isFalse);
    expect(Directory(p.join(newDir.path, 'RJ07654321')).existsSync(), isFalse);
  }, skip: Platform.isWindows || _isRoot());
}

bool _isRoot() {
  if (Platform.isWindows) return false;
  final result = Process.runSync('id', ['-u']);
  return result.stdout.toString().trim() == '0';
}
