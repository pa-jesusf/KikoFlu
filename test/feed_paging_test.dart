import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kikoeru_flutter/src/providers/auth_provider.dart';
import 'package:kikoeru_flutter/src/providers/my_reviews_provider.dart';
import 'package:kikoeru_flutter/src/providers/search_result_provider.dart';
import 'package:kikoeru_flutter/src/providers/subtitle_library_provider.dart';
import 'package:kikoeru_flutter/src/providers/works_provider.dart';
import 'package:kikoeru_flutter/src/services/kikoeru_api_service.dart'
    hide kikoeruApiServiceProvider;
import 'package:shared_preferences/shared_preferences.dart';

/// The default page size (`PageSizeNotifier.defaultSize`).
const _basePageSize = 40;

typedef _PageRequest = ({String endpoint, int page, int pageSize});

class _TestSubtitleLibraryNotifier extends SubtitleLibraryNotifier {
  @override
  Future<void> refresh() async {}
}

/// Serves a catalogue of [totalCount] works numbered from 1, paged like the
/// server: page p of size n holds works (p - 1) * n + 1 .. p * n.
class _PagingApiService extends KikoeruApiService {
  static const totalCount = 1000;

  final requests = <_PageRequest>[];

  Map<String, dynamic> _page(String endpoint, int page, int pageSize) {
    requests.add((endpoint: endpoint, page: page, pageSize: pageSize));
    final firstId = (page - 1) * pageSize + 1;
    final lastId = min(page * pageSize, totalCount);
    return {
      'works': [
        for (var id = firstId; id <= lastId; id++)
          {'id': id, 'title': 'Work $id', 'has_subtitle': true},
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
    return _page('getWorks', page, pageSize);
  }

  @override
  Future<Map<String, dynamic>> getPopularWorks({
    int page = 1,
    int pageSize = 20,
    String? keyword,
    int? subtitle,
    List<String>? withPlaylistStatus,
  }) async {
    return _page('getPopularWorks', page, pageSize);
  }

  @override
  Future<Map<String, dynamic>> searchWorks({
    required String keyword,
    int page = 1,
    int pageSize = 40,
    String? order,
    String? sort,
    int? subtitle,
    int? seed,
    bool includeTranslationWorks = true,
  }) async {
    return _page('searchWorks', page, pageSize);
  }

  @override
  Future<Map<String, dynamic>> getMyReviews({
    int page = 1,
    int pageSize = 20,
    String? filter,
    String order = 'updated_at',
    String sort = 'desc',
  }) async {
    return _page('getMyReviews', page, pageSize);
  }
}

/// The paged feeds that remap the current page when the subtitle filter
/// changes the page size.
class _PagedFeed {
  const _PagedFeed({
    required this.name,
    required this.endpoint,
    required this.open,
    required this.goToPage,
    required this.toggleSubtitleFilter,
    required this.currentPage,
    required this.workIds,
  });

  final String name;
  final String endpoint;
  final Future<void> Function(ProviderContainer container) open;
  final Future<void> Function(ProviderContainer container, int page) goToPage;
  final void Function(ProviderContainer container) toggleSubtitleFilter;
  final int Function(ProviderContainer container) currentPage;
  final List<int> Function(ProviderContainer container) workIds;
}

final _pagedFeeds = [
  _PagedFeed(
    name: 'works (All)',
    endpoint: 'getWorks',
    open: (container) =>
        container.read(worksProvider.notifier).loadWorks(targetPage: 1),
    goToPage: (container, page) =>
        container.read(worksProvider.notifier).goToPage(page),
    toggleSubtitleFilter: (container) =>
        container.read(worksProvider.notifier).toggleSubtitleFilter(),
    currentPage: (container) => container.read(worksProvider).currentPage,
    workIds: (container) =>
        container.read(worksProvider).works.map((work) => work.id).toList(),
  ),
  _PagedFeed(
    name: 'search results',
    endpoint: 'searchWorks',
    open: (container) => container
        .read(searchResultProvider.notifier)
        .initializeSearch(keyword: 'keyword'),
    goToPage: (container, page) =>
        container.read(searchResultProvider.notifier).goToPage(page),
    toggleSubtitleFilter: (container) =>
        container.read(searchResultProvider.notifier).toggleSubtitleFilter(),
    currentPage: (container) =>
        container.read(searchResultProvider).currentPage,
    workIds: (container) => container
        .read(searchResultProvider)
        .works
        .map((work) => work.id)
        .toList(),
  ),
  _PagedFeed(
    name: 'my reviews',
    endpoint: 'getMyReviews',
    open: (container) =>
        container.read(myReviewsProvider.notifier).load(targetPage: 1),
    goToPage: (container, page) =>
        container.read(myReviewsProvider.notifier).goToPage(page),
    toggleSubtitleFilter: (container) =>
        container.read(myReviewsProvider.notifier).toggleSubtitleFilter(),
    currentPage: (container) => container.read(myReviewsProvider).currentPage,
    workIds: (container) =>
        container.read(myReviewsProvider).works.map((work) => work.id).toList(),
  ),
];

ProviderContainer _createContainer(_PagingApiService apiService) {
  final container = ProviderContainer(
    overrides: [
      currentUserProvider.overrideWithValue(null),
      kikoeruApiServiceProvider.overrideWithValue(apiService),
      subtitleLibraryProvider.overrideWith(
        (ref) => _TestSubtitleLibraryNotifier(),
      ),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

/// Lets the unawaited loads started by the notifiers finish.
Future<void> _settle() async {
  for (var i = 0; i < 5; i++) {
    await Future<void>.delayed(Duration.zero);
  }
}

List<int> _ids(int first, int last) => [
  for (var id = first; id <= last; id++) id,
];

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  for (final feed in _pagedFeeds) {
    group(feed.name, () {
      // Turning the filter on doubles the page size, so the first work of
      // old page p, (p - 1) * N + 1, sits on new page ceil(p / 2).
      const pageWhenFilterTurnsOn = {1: 1, 2: 1, 3: 2, 4: 2};

      for (final MapEntry(key: oldPage, value: newPage)
          in pageWhenFilterTurnsOn.entries) {
        test('turning the subtitle filter on from page $oldPage loads page '
            '$newPage, which still holds the works being viewed', () async {
          final apiService = _PagingApiService();
          final container = _createContainer(apiService);

          await feed.open(container);
          if (oldPage != 1) await feed.goToPage(container, oldPage);
          expect(feed.currentPage(container), oldPage);
          final firstViewedId = (oldPage - 1) * _basePageSize + 1;
          expect(feed.workIds(container).first, firstViewedId);

          apiService.requests.clear();
          feed.toggleSubtitleFilter(container);
          await _settle();

          expect(apiService.requests, [
            (
              endpoint: feed.endpoint,
              page: newPage,
              pageSize: 2 * _basePageSize,
            ),
          ]);
          expect(feed.currentPage(container), newPage);
          expect(feed.workIds(container), contains(firstViewedId));
        });
      }

      test(
        'turning the subtitle filter off from page 3 loads page 5',
        () async {
          final apiService = _PagingApiService();
          final container = _createContainer(apiService);

          await feed.open(container);
          feed.toggleSubtitleFilter(container);
          await _settle();
          await feed.goToPage(container, 3);
          expect(feed.currentPage(container), 3);

          apiService.requests.clear();
          feed.toggleSubtitleFilter(container);
          await _settle();

          expect(apiService.requests, [
            (endpoint: feed.endpoint, page: 5, pageSize: _basePageSize),
          ]);
          expect(feed.currentPage(container), 5);
          expect(feed.workIds(container).first, 4 * _basePageSize + 1);
        },
      );
    });
  }

  group('works refresh', () {
    test(
      'Popular starts over from page 1 instead of merging into the list',
      () async {
        final apiService = _PagingApiService();
        final container = _createContainer(apiService);
        final notifier = container.read(worksProvider.notifier);

        notifier.setDisplayMode(DisplayMode.popular);
        await _settle();
        await notifier.loadMore();
        await notifier.loadMore();
        expect(apiService.requests.map((request) => request.page), [1, 2, 3]);
        expect(
          container.read(worksProvider).works,
          hasLength(3 * _basePageSize),
        );

        apiService.requests.clear();
        await notifier.refresh();

        expect(apiService.requests, [
          (endpoint: 'getPopularWorks', page: 1, pageSize: _basePageSize),
        ]);
        final state = container.read(worksProvider);
        expect(state.currentPage, 1);
        expect(state.works.map((work) => work.id), _ids(1, _basePageSize));
        expect(state.hasMore, isTrue);
      },
    );

    test('All reloads the page being viewed', () async {
      final apiService = _PagingApiService();
      final container = _createContainer(apiService);
      final notifier = container.read(worksProvider.notifier);

      await notifier.loadWorks(targetPage: 1);
      await notifier.goToPage(3);

      apiService.requests.clear();
      await notifier.refresh();

      expect(apiService.requests, [
        (endpoint: 'getWorks', page: 3, pageSize: _basePageSize),
      ]);
      final state = container.read(worksProvider);
      expect(state.currentPage, 3);
      expect(
        state.works.map((work) => work.id),
        _ids(2 * _basePageSize + 1, 3 * _basePageSize),
      );
    });
  });
}
