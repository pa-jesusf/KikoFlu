import 'package:flutter_test/flutter_test.dart';
import 'package:kikoeru_flutter/src/services/log_service.dart';

void main() {
  String redact(String s) => LogService.redactSensitive(s);

  test('redacts request headers printed by LogInterceptor', () {
    expect(
      redact(' Authorization: Bearer eyJhbGciOi.eyJzdWIi.sig'),
      ' Authorization: <redacted>',
    );
    expect(
      redact(' cookie: cf_clearance=abc; session=def'),
      ' cookie: <redacted>',
    );
  });

  test('redacts login request and response bodies', () {
    expect(
      redact('{name: alice, password: hunter2}'),
      '{name: alice, password: <redacted>}',
    );
    expect(
      redact('{"user":{"name":"alice"},"token":"eyJ.abc.def"}'),
      '{"user":{"name":"alice"},"token":"<redacted>"}',
    );
    expect(redact('{"password":"p\\"w"}'), '{"password":"<redacted>"}');
  });

  test('redacts tokens in URLs', () {
    expect(
      redact('url=https://api.example.com/media/stream/1?token=eyJ.abc&x=1'),
      'url=https://api.example.com/media/stream/1?token=<redacted>&x=1',
    );
  });

  test('keeps ordinary messages and token status lines intact', () {
    const lines = [
      '[API] Initialized - host: https://x, token: exists (120 chars)',
      '[API] Initialized - host: https://x, token: empty',
      '开始网络下载: 01.mp3',
      'uri: https://api.example.com/api/works?page=2',
    ];
    for (final line in lines) {
      expect(redact(line), line);
    }
  });

  test('stored log entries are redacted', () {
    LogService.instance.info('url=https://h/a?token=secret');
    expect(
      LogService.instance.logs.last.message,
      'url=https://h/a?token=<redacted>',
    );
  });
}
