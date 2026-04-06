import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// 字幕文件数据库记录
class SubtitleFileRecord {
  final String fileName;
  final String filePath;
  final String relativePath;
  final String category;
  final int? workId;
  final int fileSize;
  final String? modifiedAt;
  final String? normalizedName;

  SubtitleFileRecord({
    required this.fileName,
    required this.filePath,
    required this.relativePath,
    required this.category,
    this.workId,
    this.fileSize = 0,
    this.modifiedAt,
    this.normalizedName,
  });

  Map<String, dynamic> toMap() => {
        'file_name': fileName,
        'file_path': filePath,
        'relative_path': relativePath,
        'category': category,
        'work_id': workId,
        'file_size': fileSize,
        'modified_at': modifiedAt,
        'normalized_name': normalizedName,
      };

  factory SubtitleFileRecord.fromMap(Map<String, dynamic> map) {
    return SubtitleFileRecord(
      fileName: map['file_name'] as String,
      filePath: map['file_path'] as String,
      relativePath: map['relative_path'] as String,
      category: map['category'] as String,
      workId: map['work_id'] as int?,
      fileSize: (map['file_size'] as int?) ?? 0,
      modifiedAt: map['modified_at'] as String?,
      normalizedName: map['normalized_name'] as String?,
    );
  }
}

/// 字幕库数据库
class SubtitleDatabase {
  static final SubtitleDatabase instance = SubtitleDatabase._init();
  static Database? _database;

  SubtitleDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('subtitle_library.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final String dbPath;
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      final appDocDir = await getApplicationDocumentsDirectory();
      dbPath = p.join(appDocDir.path, 'KikoFlu');
      await Directory(dbPath).create(recursive: true);
    } else {
      dbPath = await getDatabasesPath();
    }
    final path = p.join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE subtitle_files (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        file_name TEXT NOT NULL,
        file_path TEXT NOT NULL UNIQUE,
        relative_path TEXT NOT NULL,
        category TEXT NOT NULL,
        work_id INTEGER,
        file_size INTEGER DEFAULT 0,
        modified_at TEXT,
        normalized_name TEXT,
        created_at TEXT DEFAULT (datetime('now'))
      )
    ''');

    await db.execute(
        'CREATE INDEX idx_files_work_id ON subtitle_files(work_id)');
    await db.execute(
        'CREATE INDEX idx_files_category ON subtitle_files(category)');
    await db.execute(
        'CREATE INDEX idx_files_file_path ON subtitle_files(file_path)');

    await db.execute('''
      CREATE TABLE library_meta (
        key TEXT PRIMARY KEY,
        value TEXT
      )
    ''');
  }

  // ==================== CRUD ====================

  /// 插入单条记录
  Future<void> insertFile(SubtitleFileRecord record) async {
    final db = await database;
    await db.insert('subtitle_files', record.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// 批量插入（事务）
  Future<void> insertFiles(List<SubtitleFileRecord> records) async {
    if (records.isEmpty) return;
    final db = await database;
    final batch = db.batch();
    for (final record in records) {
      batch.insert('subtitle_files', record.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit(noResult: true);
  }

  /// 按文件路径删除
  Future<int> deleteByPath(String filePath) async {
    final db = await database;
    return await db.delete('subtitle_files',
        where: 'file_path = ?', whereArgs: [filePath]);
  }

  /// 按路径前缀删除（用于删除目录下所有文件）
  Future<int> deleteByPathPrefix(String directoryPath) async {
    final db = await database;
    // 确保路径以 / 结尾，避免误删同前缀的其他目录
    final prefix =
        directoryPath.endsWith('/') ? directoryPath : '$directoryPath/';
    return await db.delete('subtitle_files',
        where: 'file_path LIKE ?', whereArgs: ['$prefix%']);
  }

  /// 更新单个文件的路径（重命名）
  Future<void> updateFilePath(
    String oldPath,
    String newFilePath,
    String newRelativePath,
    String newFileName,
  ) async {
    final db = await database;
    await db.update(
      'subtitle_files',
      {
        'file_path': newFilePath,
        'relative_path': newRelativePath,
        'file_name': newFileName,
      },
      where: 'file_path = ?',
      whereArgs: [oldPath],
    );
  }

  /// 批量更新目录路径（目录重命名/移动）
  Future<void> updateDirectoryPaths(
    String oldDirPath,
    String newDirPath,
    String libraryRootPath,
  ) async {
    final db = await database;
    final oldPrefix =
        oldDirPath.endsWith('/') ? oldDirPath : '$oldDirPath/';
    final files = await db.query('subtitle_files',
        where: 'file_path LIKE ?', whereArgs: ['$oldPrefix%']);

    if (files.isEmpty) return;

    final batch = db.batch();
    for (final file in files) {
      final oldFilePath = file['file_path'] as String;
      final newFilePath = oldFilePath.replaceFirst(oldDirPath, newDirPath);
      var newRelativePath =
          newFilePath.substring(libraryRootPath.length + 1);
      // 统一用 / 存储相对路径
      if (Platform.isWindows) {
        newRelativePath = newRelativePath.replaceAll('\\', '/');
      }
      final parts = newRelativePath.split('/');
      final newCategory = parts.isNotEmpty ? parts.first : '';
      final newWorkId = _extractWorkIdFromRelativePath(newRelativePath);

      batch.update(
        'subtitle_files',
        {
          'file_path': newFilePath,
          'relative_path': newRelativePath,
          'category': newCategory,
          'work_id': newWorkId,
        },
        where: 'id = ?',
        whereArgs: [file['id']],
      );
    }
    await batch.commit(noResult: true);
  }

  // ==================== 查询 ====================

  /// 获取所有文件记录
  Future<List<Map<String, dynamic>>> getAllFiles() async {
    final db = await database;
    return await db.query('subtitle_files', orderBy: 'relative_path');
  }

  /// 按 workId 查询
  Future<List<SubtitleFileRecord>> getFilesByWorkId(int workId) async {
    final db = await database;
    final results = await db.query('subtitle_files',
        where: 'work_id = ?', whereArgs: [workId]);
    return results.map((m) => SubtitleFileRecord.fromMap(m)).toList();
  }

  /// 按分类查询
  Future<List<SubtitleFileRecord>> getFilesByCategory(
      String category) async {
    final db = await database;
    final results = await db.query('subtitle_files',
        where: 'category = ?', whereArgs: [category]);
    return results.map((m) => SubtitleFileRecord.fromMap(m)).toList();
  }

  /// 获取所有不重复的 workId
  Future<Set<int>> getDistinctWorkIds() async {
    final db = await database;
    final results = await db.rawQuery(
        'SELECT DISTINCT work_id FROM subtitle_files WHERE work_id IS NOT NULL');
    return results
        .map((r) => r['work_id'] as int)
        .toSet();
  }

  /// 获取已解析目录下的文件夹名列表
  Future<List<String>> getParsedFolderNames(String parsedCategory) async {
    final db = await database;
    final results = await db.rawQuery('''
      SELECT DISTINCT 
        CASE 
          WHEN INSTR(SUBSTR(relative_path, LENGTH(?) + 2), '/') > 0
          THEN SUBSTR(SUBSTR(relative_path, LENGTH(?) + 2), 1, 
               INSTR(SUBSTR(relative_path, LENGTH(?) + 2), '/') - 1)
          ELSE SUBSTR(relative_path, LENGTH(?) + 2)
        END as folder_name
      FROM subtitle_files 
      WHERE category = ?
    ''', [parsedCategory, parsedCategory, parsedCategory, parsedCategory, parsedCategory]);
    return results
        .map((r) => r['folder_name'] as String)
        .where((name) => name.isNotEmpty && name.contains('.') == false)
        .toList();
  }

  /// 获取统计信息（文件数 + 总大小）
  Future<Map<String, int>> getStatsRaw() async {
    final db = await database;
    final result = await db.rawQuery(
        'SELECT COUNT(*) as total_files, COALESCE(SUM(file_size), 0) as total_size FROM subtitle_files');
    return {
      'totalFiles': (result.first['total_files'] as int?) ?? 0,
      'totalSize': (result.first['total_size'] as int?) ?? 0,
    };
  }

  /// 获取文件记录数量
  Future<int> getFileCount() async {
    final db = await database;
    return Sqflite.firstIntValue(
            await db.rawQuery('SELECT COUNT(*) FROM subtitle_files')) ??
        0;
  }

  /// 获取不重复的文件夹数量（从 relative_path 推算）
  Future<int> getFolderCount() async {
    final db = await database;
    // 提取 relative_path 中所有目录层级，去重计数
    // 例如 "已解析/RJ123/sub/a.vtt" → "已解析", "已解析/RJ123", "已解析/RJ123/sub"
    final results = await db.query('subtitle_files', columns: ['relative_path']);
    final folderPaths = <String>{};
    for (final row in results) {
      final relativePath = row['relative_path'] as String;
      final parts = relativePath.split('/');
      for (int i = 1; i < parts.length; i++) {
        folderPaths.add(parts.sublist(0, i).join('/'));
      }
    }
    return folderPaths.length;
  }

  // ==================== 元数据 ====================

  Future<String?> getMeta(String key) async {
    final db = await database;
    final results = await db.query('library_meta',
        where: 'key = ?', whereArgs: [key], limit: 1);
    if (results.isEmpty) return null;
    return results.first['value'] as String?;
  }

  Future<void> setMeta(String key, String value) async {
    final db = await database;
    await db.insert('library_meta', {'key': key, 'value': value},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // ==================== 维护 ====================

  /// 清空所有记录
  Future<void> clear() async {
    final db = await database;
    await db.delete('subtitle_files');
  }

  // ==================== 工具方法 ====================

  static final _workIdRegex = RegExp(r'[RrBbVv][Jj]0*(\d+)');

  /// 从相对路径提取 workId
  static int? _extractWorkIdFromRelativePath(String relativePath) {
    // 相对路径格式: "已解析/RJ1003058/track.vtt"
    final parts = relativePath.split('/');
    if (parts.length < 2) return null;
    // 检查第二级目录名
    final match = _workIdRegex.firstMatch(parts[1]);
    if (match != null) {
      return int.tryParse(match.group(1)!);
    }
    return null;
  }
}
