import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:kikoeru_flutter/src/models/user.dart';
import 'package:kikoeru_flutter/src/providers/auth_provider.dart';
import 'package:kikoeru_flutter/src/services/kikoeru_api_service.dart'
    show KikoeruApiException, KikoeruApiService;
import 'package:kikoeru_flutter/src/services/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _hostA = 'https://server-a.example';
const _hostB = 'https://server-b.example';
const _tokenA = 'token-a';

/// Starting without a saved session, or a successful login, reaches
/// AccountDatabase. On Linux and Windows path_provider resolves the real
/// Documents folder under `flutter test`, where AccountDatabase would create a
/// KikoFlu folder, so those tests only run on the other platforms.
final Object _skipOutsideTempDirs = Platform.isLinux || Platform.isWindows
    ? 'AccountDatabase would touch the real Documents folder'
    : false;

/// Accepts credentials only on server A; every other server rejects them.
class _FakeApiService extends KikoeruApiService {
  final List<String> loginHosts = [];
  final List<String> registerHosts = [];
  int userInfoCalls = 0;

  @override
  Future<Map<String, dynamic>> login(
    String username,
    String password,
    String host,
  ) async {
    loginHosts.add(host);
    if (host != _hostA) {
      throw KikoeruApiException('Login failed', 'HTTP 401');
    }
    return {
      'token': _tokenA,
      'user': {'name': username, 'group': 'user', 'loggedIn': true},
    };
  }

  @override
  Future<Map<String, dynamic>> register(
    String username,
    String password,
    String host,
  ) async {
    registerHosts.add(host);
    throw KikoeruApiException('Registration failed', 'HTTP 403');
  }

  @override
  Future<Map<String, dynamic>> getUserInfo() async {
    userInfoCalls++;
    return {
      'user': {'name': 'alice', 'group': 'user', 'loggedIn': true},
    };
  }
}

/// What login() leaves in storage after signing in to server A.
Map<String, Object> _savedSessionA({String? cookie}) {
  final user = User(
    name: 'alice',
    host: _hostA,
    token: _tokenA,
    loggedIn: true,
    serverCookie: cookie,
  );
  return {
    'auth_token': _tokenA,
    'server_host': _hostA,
    'current_user': jsonEncode(user.toJson()),
    if (cookie != null) 'server_cookie': cookie,
  };
}

Future<void> _waitUntil(bool Function() condition) async {
  final deadline = DateTime.now().add(const Duration(seconds: 10));
  while (!condition()) {
    if (DateTime.now().isAfter(deadline)) {
      fail('Timed out waiting for AuthNotifier to finish loading');
    }
    await Future<void>.delayed(const Duration(milliseconds: 5));
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory hiveDir;

  setUpAll(() {
    hiveDir = Directory.systemTemp.createTempSync('auth_login_failure_test');
    Hive.init(hiveDir.path);
  });

  tearDownAll(() async {
    await Hive.close();
    hiveDir.deleteSync(recursive: true);
  });

  Future<(ProviderContainer, AuthNotifier)> createNotifier(
    _FakeApiService api,
    Map<String, Object> storedValues,
  ) async {
    SharedPreferences.setMockInitialValues(storedValues);
    await StorageService.init();
    final container = ProviderContainer(
      overrides: [kikoeruApiServiceProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    return (container, container.read(authProvider.notifier));
  }

  /// Restores session A from storage the way the app does on start-up.
  Future<(ProviderContainer, AuthNotifier)> startWithSessionA(
    _FakeApiService api, {
    String? cookie,
  }) async {
    final created = await createNotifier(api, _savedSessionA(cookie: cookie));
    // Validating the stored token only touches the fake API and in-memory
    // preferences, so a few event-loop turns are enough.
    for (var i = 0; i < 5; i++) {
      await Future<void>.delayed(Duration.zero);
    }
    expect(api.userInfoCalls, 1);
    expect(created.$1.read(authProvider).isLoggedIn, isTrue);
    return created;
  }

  /// Starts with no saved session. With no token the start-up load looks up
  /// the account database (unavailable in tests) and then calls logout(),
  /// which clears 'current_user'; a placeholder there shows when it is done,
  /// so it cannot run in the middle of the login under test.
  Future<(ProviderContainer, AuthNotifier)> startWithoutSession(
    _FakeApiService api,
  ) async {
    final created = await createNotifier(api, {'current_user': '{}'});
    await _waitUntil(() => StorageService.getString('current_user') == null);
    expect(api.currentHost, isNull);
    return created;
  }

  void expectStillOnServerA(
    ProviderContainer container,
    _FakeApiService api, {
    required String? cookie,
    required String error,
  }) {
    expect(api.currentHost, _hostA);
    expect(api.currentToken, _tokenA);
    expect(StorageService.getString('server_cookie'), cookie);
    expect(StorageService.getString('auth_token'), _tokenA);
    expect(StorageService.getString('server_host'), _hostA);

    final state = container.read(authProvider);
    expect(state.isLoggedIn, isTrue);
    expect(state.isLoading, isFalse);
    expect(state.host, _hostA);
    expect(state.token, _tokenA);
    expect(state.currentUser?.name, 'alice');
    expect(state.error, contains(error));
  }

  test('failed login to another server keeps the current session', () async {
    final api = _FakeApiService();
    final (container, notifier) = await startWithSessionA(
      api,
      cookie: 'a-cookie',
    );

    final success = await notifier.login('bob', 'wrong', _hostB, 'b-cookie');

    expect(success, isFalse);
    expect(api.loginHosts, [_hostB]);
    expectStillOnServerA(
      container,
      api,
      cookie: 'a-cookie',
      error: 'Login failed',
    );
  });

  test(
    'failed registration on another server keeps the current session',
    () async {
      final api = _FakeApiService();
      final (container, notifier) = await startWithSessionA(
        api,
        cookie: 'a-cookie',
      );

      final success = await notifier.register('bob', 'pw', _hostB, 'b-cookie');

      expect(success, isFalse);
      expect(api.registerHosts, [_hostB]);
      expectStillOnServerA(
        container,
        api,
        cookie: 'a-cookie',
        error: 'Registration failed',
      );
    },
  );

  test(
    'failed login does not leave the new cookie on a session without one',
    () async {
      final api = _FakeApiService();
      final (container, notifier) = await startWithSessionA(api);

      final success = await notifier.login('bob', 'wrong', _hostB, 'b-cookie');

      expect(success, isFalse);
      expectStillOnServerA(container, api, cookie: null, error: 'Login failed');
    },
  );

  test(
    'failed login after signing in through login() keeps that session',
    () async {
      final api = _FakeApiService();
      final (container, notifier) = await startWithoutSession(api);

      expect(await notifier.login('alice', 'pw', _hostA, 'a-cookie'), isTrue);
      expect(api.currentHost, _hostA);
      expect(api.currentToken, _tokenA);
      expect(StorageService.getString('server_cookie'), 'a-cookie');

      final success = await notifier.login('bob', 'wrong', _hostB, 'b-cookie');

      expect(success, isFalse);
      expect(api.loginHosts, [_hostA, _hostB]);
      expectStillOnServerA(
        container,
        api,
        cookie: 'a-cookie',
        error: 'Login failed',
      );
    },
    skip: _skipOutsideTempDirs,
  );

  test(
    'first failed login without a previous session leaves no cookie',
    () async {
      final api = _FakeApiService();
      final (container, notifier) = await startWithoutSession(api);

      final success = await notifier.login('bob', 'wrong', _hostB, 'b-cookie');

      expect(success, isFalse);
      expect(StorageService.getString('server_cookie'), isNull);
      expect(StorageService.getString('auth_token'), isNull);

      final state = container.read(authProvider);
      expect(state.isLoggedIn, isFalse);
      expect(state.isLoading, isFalse);
      expect(state.currentUser, isNull);
      expect(state.error, contains('Login failed'));
    },
    skip: _skipOutsideTempDirs,
  );
}
