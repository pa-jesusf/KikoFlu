import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kikoeru_flutter/l10n/app_localizations.dart';
import 'package:kikoeru_flutter/src/providers/auth_provider.dart';
import 'package:kikoeru_flutter/src/providers/settings_provider.dart';
import 'package:kikoeru_flutter/src/providers/subtitle_library_provider.dart';
import 'package:kikoeru_flutter/src/providers/works_provider.dart';
import 'package:kikoeru_flutter/src/screens/works_screen.dart';
import 'package:kikoeru_flutter/src/services/kikoeru_api_service.dart'
    hide kikoeruApiServiceProvider;
import 'package:shared_preferences/shared_preferences.dart';

/// Serves one full page per feed mode, with distinct work IDs per mode.
///
/// Popular and recommended report exactly one page in total so the feed does
/// not load more while the test scrolls it.
class _FakeApiService extends KikoeruApiService {
  static Map<String, dynamic> _page({
    required int firstId,
    required int page,
    required int pageSize,
    required int totalCount,
  }) {
    final start = firstId + (page - 1) * pageSize;
    return {
      'works': [
        for (var id = start; id < start + pageSize; id++)
          {'id': id, 'title': 'Work $id'},
      ],
      'pagination': {
        'currentPage': page,
        'pageSize': pageSize,
        'totalCount': totalCount,
      },
    };
  }

  @override
  Future<Map<String, dynamic>> getWorks({
    int page = 1,
    int pageSize = 40,
    String? order,
    String? sort,
    int? subtitle,
    int? seed,
  }) async {
    return _page(
      firstId: 1000,
      page: page,
      pageSize: pageSize,
      totalCount: pageSize * 10,
    );
  }

  @override
  Future<Map<String, dynamic>> getPopularWorks({
    int page = 1,
    int pageSize = 20,
    String? keyword,
    int? subtitle,
    List<String>? withPlaylistStatus,
  }) async {
    return _page(
      firstId: 2000,
      page: page,
      pageSize: pageSize,
      totalCount: pageSize,
    );
  }

  @override
  Future<Map<String, dynamic>> getRecommendedWorks({
    required String recommenderUuid,
    int page = 1,
    int pageSize = 20,
    String? keyword,
    int? subtitle,
    List<String>? withPlaylistStatus,
  }) async {
    return _page(
      firstId: 3000,
      page: page,
      pageSize: pageSize,
      totalCount: pageSize,
    );
  }
}

/// Signed-out auth state without touching storage or the network.
class _FakeAuthNotifier extends StateNotifier<AuthState>
    implements AuthNotifier {
  _FakeAuthNotifier() : super(const AuthState());

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _TestSubtitleLibraryNotifier extends SubtitleLibraryNotifier {
  @override
  Future<void> refresh() async {}
}

ProviderContainer _createContainer() {
  final container = ProviderContainer(
    overrides: [
      kikoeruApiServiceProvider.overrideWithValue(_FakeApiService()),
      authProvider.overrideWith((ref) => _FakeAuthNotifier()),
      subtitleLibraryProvider.overrideWith(
        (ref) => _TestSubtitleLibraryNotifier(),
      ),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

/// Hosts [WorksScreen] the way MainScreen does: under a PageStorage whose
/// bucket outlives the page. Flipping [landscape] swaps the surrounding tree,
/// which recreates the WorksScreen State like a rotation does in MainScreen.
Widget _testApp(
  ProviderContainer container,
  PageStorageBucket bucket,
  ValueNotifier<bool> landscape,
) {
  return UncontrolledProviderScope(
    container: container,
    child: MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: S.localizationsDelegates,
      supportedLocales: S.supportedLocales,
      home: ValueListenableBuilder<bool>(
        valueListenable: landscape,
        builder: (context, isLandscape, _) {
          final pages = PageStorage(
            bucket: bucket,
            child: const WorksScreen(key: PageStorageKey('works_screen')),
          );
          if (!isLandscape) return pages;
          return Row(
            children: [
              const SizedBox(width: 80),
              Expanded(child: pages),
            ],
          );
        },
      ),
    ),
  );
}

Finder get _feedScrollable => find.descendant(
  of: find.byType(CustomScrollView),
  matching: find.byType(Scrollable),
);

ScrollPosition _feedPosition(WidgetTester tester) {
  expect(find.byType(CustomScrollView), findsOneWidget);
  return tester.state<ScrollableState>(_feedScrollable.first).position;
}

Future<void> _scrollFeedTo(WidgetTester tester, double offset) async {
  final position = _feedPosition(tester);
  expect(position.maxScrollExtent, greaterThan(offset));
  position.jumpTo(offset);
  await tester.pumpAndSettle();
}

Future<void> _selectMode(WidgetTester tester, String label) async {
  await tester.tap(find.text(label));
  await tester.pumpAndSettle();
}

/// Swaps the tree around WorksScreen and checks that its State was recreated.
Future<void> _rebuildWorksScreen(
  WidgetTester tester,
  ValueNotifier<bool> landscape,
) async {
  final stateBefore = tester.state(find.byType(WorksScreen));
  landscape.value = !landscape.value;
  await tester.pumpAndSettle();
  expect(tester.state(find.byType(WorksScreen)), isNot(same(stateBefore)));
}

void _mockPreferences({LayoutType? layout}) {
  SharedPreferences.setMockInitialValues({
    LiquidGlassNavigationNotifier.preferenceKey: false,
    // The masonry grid of the default layout pulls an offset restored from
    // PageStorage back on its first layout, so the restore checks use the
    // list layout, where the restored offset is exact.
    if (layout != null) WorksNotifier.layoutPreferenceKey: layout.name,
  });
}

void main() {
  setUp(_mockPreferences);

  testWidgets(
    'switching mode again while the previous grid is animating out works',
    (tester) async {
      final container = _createContainer();
      final landscape = ValueNotifier(false);
      addTearDown(landscape.dispose);
      await tester.pumpWidget(
        _testApp(container, PageStorageBucket(), landscape),
      );
      await tester.pumpAndSettle();
      expect(find.text('Work 1000'), findsOneWidget);

      await tester.tap(find.text('Popular'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      expect(tester.takeException(), isNull);
      // The outgoing All grid is still mounted next to the Popular grid.
      expect(find.byType(CustomScrollView), findsNWidgets(2));

      await tester.tap(find.text('Recommended'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      expect(tester.takeException(), isNull);

      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(
        container.read(worksProvider).displayMode,
        DisplayMode.recommended,
      );
      expect(find.byType(CustomScrollView), findsOneWidget);
      expect(find.text('Work 3000'), findsOneWidget);
    },
  );

  for (final layout in [LayoutType.bigGrid, LayoutType.list]) {
    testWidgets(
      'switching back to a mode whose grid is still animating out works '
      '(${layout.name})',
      (tester) async {
        _mockPreferences(layout: layout);
        final container = _createContainer();
        final landscape = ValueNotifier(false);
        addTearDown(landscape.dispose);
        await tester.pumpWidget(
          _testApp(container, PageStorageBucket(), landscape),
        );
        await tester.pumpAndSettle();
        await _scrollFeedTo(tester, 300);

        const taps = [
          ('Popular', DisplayMode.popular),
          ('All', DisplayMode.all),
          ('Popular', DisplayMode.popular),
          ('All', DisplayMode.all),
        ];
        for (final (label, mode) in taps) {
          await tester.tap(find.text(label));
          await tester.pump();
          await tester.pump(const Duration(milliseconds: 100));
          expect(tester.takeException(), isNull, reason: 'tap $label');
          expect(container.read(worksProvider).displayMode, mode);
        }

        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        expect(container.read(worksProvider).displayMode, DisplayMode.all);
        expect(_feedPosition(tester).pixels, 300);
      },
    );
  }

  testWidgets('the current mode keeps its offset when WorksScreen is rebuilt', (
    tester,
  ) async {
    _mockPreferences(layout: LayoutType.list);
    final container = _createContainer();
    final landscape = ValueNotifier(false);
    addTearDown(landscape.dispose);
    await tester.pumpWidget(
      _testApp(container, PageStorageBucket(), landscape),
    );
    await tester.pumpAndSettle();
    await _scrollFeedTo(tester, 900);

    await _rebuildWorksScreen(tester, landscape);
    expect(_feedPosition(tester).pixels, 900);

    await _scrollFeedTo(tester, 1500);
    await _rebuildWorksScreen(tester, landscape);
    expect(_feedPosition(tester).pixels, 1500);
  });

  testWidgets('each mode keeps its own offset across a WorksScreen rebuild', (
    tester,
  ) async {
    _mockPreferences(layout: LayoutType.list);
    final container = _createContainer();
    final landscape = ValueNotifier(false);
    addTearDown(landscape.dispose);
    await tester.pumpWidget(
      _testApp(container, PageStorageBucket(), landscape),
    );
    await tester.pumpAndSettle();
    await _scrollFeedTo(tester, 900);

    await _selectMode(tester, 'Popular');
    expect(find.text('Work 2000'), findsOneWidget);
    expect(_feedPosition(tester).pixels, 0);
    await _scrollFeedTo(tester, 500);

    await _selectMode(tester, 'All');
    expect(_feedPosition(tester).pixels, 900);

    await _rebuildWorksScreen(tester, landscape);
    expect(_feedPosition(tester).pixels, 900);

    await _selectMode(tester, 'Popular');
    expect(_feedPosition(tester).pixels, 500);

    await _selectMode(tester, 'Recommended');
    expect(find.text('Work 3000'), findsOneWidget);
    expect(_feedPosition(tester).pixels, 0);

    await _selectMode(tester, 'All');
    expect(_feedPosition(tester).pixels, 900);
  });
}
