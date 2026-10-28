import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_liquid_glass/real_liquid_glass.dart';

import '../../l10n/app_localizations.dart';
import '../providers/audio_provider.dart';
import '../providers/update_provider.dart';
import '../providers/auth_provider.dart';
import '../widgets/main_bottom_navigation_bar.dart';
import '../widgets/mini_player.dart';
import '../widgets/liquid_glass_layout.dart';
import 'works_screen.dart';
import 'search_screen.dart';
import 'my_screen.dart';
import 'settings_screen.dart';
import '../providers/settings_provider.dart';
import '../services/native_tab_bar_service.dart';
import '../utils/responsive_grid_helper.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> with RouteAware {
  int _currentIndex = 0;
  static const int _settingsTabIndex = 3;

  // 使用 PageStorageBucket 来保存页面状态
  final PageStorageBucket _bucket = PageStorageBucket();
  // 在不同布局之间切换（旋转、折叠屏展开/合上）时保留各页面的状态
  final GlobalKey _pagesKey = GlobalKey();
  final ValueNotifier<double> _liquidDockExtent = ValueNotifier(0);

  // iPhone Duo 的竖状态栏（时间、Wi-Fi）在机身一侧，系统把它作为约 84pt 的
  // 左侧或右侧安全区。普通 iPhone 横屏时灵动岛一侧约 60pt，不会被误判。
  static const double _minVerticalStatusBarWidth = 72;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = const [
      WorksScreen(key: PageStorageKey('works_screen')),
      SearchScreen(key: PageStorageKey('search_screen')),
      MyScreen(key: PageStorageKey('my_screen')),
      SettingsScreen(key: PageStorageKey('settings_screen')),
    ];
    if (NativeTabBarService.isActive) {
      NativeTabBarService.onSelect = _handleDestinationSelected;
      NativeTabBarService.setSelectedIndex(_currentIndex);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (NativeTabBarService.isActive && route is PageRoute) {
      NativeTabBarService.routeObserver.subscribe(this, route);
    }
  }

  @override
  void dispose() {
    if (NativeTabBarService.isActive) {
      NativeTabBarService.routeObserver.unsubscribe(this);
      NativeTabBarService.onSelect = null;
      NativeTabBarService.setTabBarHidden(true);
    }
    _liquidDockExtent.dispose();
    super.dispose();
  }

  // 原生标签栏只在主界面显示，进入作品详情、播放器等页面时收起
  @override
  void didPush() => NativeTabBarService.setTabBarHidden(false);

  @override
  void didPopNext() => NativeTabBarService.setTabBarHidden(false);

  @override
  void didPushNext() => NativeTabBarService.setTabBarHidden(true);

  List<NavigationDestination> _buildDestinations(
      BuildContext context, bool showUpdateBadge) {
    final s = S.of(context);
    return [
      NavigationDestination(
        icon: const Icon(Icons.home_outlined),
        selectedIcon: const Icon(Icons.home),
        label: s.navHome,
      ),
      NavigationDestination(
        icon: const Icon(Icons.search_outlined),
        selectedIcon: const Icon(Icons.search),
        label: s.navSearch,
      ),
      NavigationDestination(
        icon: const Icon(Icons.favorite_border),
        selectedIcon: const Icon(Icons.favorite),
        label: s.navMy,
      ),
      NavigationDestination(
        icon: Badge(
          isLabelVisible: showUpdateBadge,
          child: const Icon(Icons.settings_outlined),
        ),
        selectedIcon: Badge(
          isLabelVisible: showUpdateBadge,
          child: const Icon(Icons.settings),
        ),
        label: s.navSettings,
      ),
    ];
  }

  void _handleDestinationSelected(int index) {
    if (_currentIndex == index) {
      return;
    }

    setState(() {
      _currentIndex = index;
    });

    if (index == _settingsTabIndex) {
      ref.read(settingsCacheRefreshTriggerProvider.notifier).state++;
    }
  }

  /// 竖状态栏所在的一侧和宽度；没有竖状态栏（或设备旋转后状态栏到了顶部）时返回 null。
  ({bool onLeft, double width})? _verticalStatusBar(BuildContext context) {
    if (!Platform.isIOS) return null;
    final padding = MediaQuery.viewPaddingOf(context);
    if (padding.right >= _minVerticalStatusBarWidth) {
      return (onLeft: false, width: padding.right);
    }
    if (padding.left >= _minVerticalStatusBarWidth) {
      return (onLeft: true, width: padding.left);
    }
    return null;
  }

  Widget _buildPages() {
    return KeyedSubtree(
      key: _pagesKey,
      child: PageStorage(
        bucket: _bucket,
        child: IndexedStack(
          index: _currentIndex,
          children: List.generate(_screens.length, (index) {
            return HeroMode(
              enabled: index == _currentIndex,
              child: _screens[index],
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isTabletLayout = ResponsiveGridHelper.isTabletLayout(context);
    final statusBar = _verticalStatusBar(context);
    final showUpdateBadge = ref.watch(showUpdateRedDotProvider);
    final useLiquidGlass = ref.watch(liquidGlassNavigationProvider);
    final destinations = _buildDestinations(context, showUpdateBadge);

    if (NativeTabBarService.isActive) {
      NativeTabBarService.setTitles(
        destinations.map((destination) => destination.label).toList(),
      );
      NativeTabBarService.setBadge(_settingsTabIndex, showUpdateBadge);
      return _buildNativeTabBarLayout(context);
    }

    if (isTabletLayout || statusBar != null) {
      // 横屏或平板式布局：使用 NavigationRail。
      // 有竖状态栏时（iPhone Duo），导航放进状态栏、Wi-Fi 图标下面。
      final landscapeScaffold = Scaffold(
        body: Stack(
          children: [
            // 主内容区域
            Row(
              children: [
                if (statusBar != null && statusBar.onLeft)
                  _buildStatusBarNavigationRail(destinations, statusBar.width),
                if (statusBar == null) ...[
                  // 侧边导航栏
                  SafeArea(
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height -
                              MediaQuery.of(context).padding.top -
                              MediaQuery.of(context).padding.bottom,
                        ),
                        child: IntrinsicHeight(
                          child: Padding(
                            padding: useLiquidGlass
                                ? const EdgeInsets.all(8)
                                : EdgeInsets.zero,
                            child: useLiquidGlass
                                ? Consumer(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(28),
                                      child: _buildNavigationRail(destinations),
                                    ),
                                    builder: (context, ref, child) {
                                      return LiquidGlassContainer(
                                        shape: const LiquidGlassShape
                                            .roundedRectangle(28),
                                        fallbackIntensity: ref.watch(
                                          fallbackGlassTransparencyProvider,
                                        ),
                                        child: child,
                                      );
                                    },
                                  )
                                : _buildNavigationRail(destinations),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const VerticalDivider(thickness: 1, width: 1),
                ],
                // 页面内容
                Expanded(
                  child: Consumer(
                    builder: (context, ref, child) {
                      final authState = ref.watch(authProvider);
                      final isOfflineMode = authState.currentUser != null &&
                          !authState.isLoggedIn &&
                          authState.error != null;

                      final pages = _buildPages();
                      final miniPlayer = Consumer(
                        builder: (context, ref, child) {
                          final currentTrack = ref.watch(currentTrackProvider);
                          return currentTrack.when(
                            data: (track) => track != null
                                ? const MiniPlayer()
                                : const SizedBox.shrink(),
                            loading: () => const SizedBox.shrink(),
                            error: (_, __) => const SizedBox.shrink(),
                          );
                        },
                      );

                      final content = useLiquidGlass
                          ? LiquidGlassDockOverlay(
                              onExtentChanged: (extent) {
                                if (_liquidDockExtent.value != extent) {
                                  _liquidDockExtent.value = extent;
                                }
                              },
                              dock: AnimatedSize(
                                duration: const Duration(milliseconds: 180),
                                curve: Curves.easeOutCubic,
                                alignment: Alignment.bottomCenter,
                                child: miniPlayer,
                              ),
                              child: pages,
                            )
                          : Column(
                              children: [
                                Expanded(child: pages),
                                miniPlayer,
                              ],
                            );

                      final paddedContent = Padding(
                        padding: EdgeInsets.only(top: isOfflineMode ? 30 : 0),
                        child: SafeArea(
                          top: false,
                          bottom: !useLiquidGlass,
                          child: content,
                        ),
                      );
                      // 状态栏那一侧的安全区由导航占用，内容区不再重复留出
                      return statusBar == null
                          ? paddedContent
                          : MediaQuery.removePadding(
                              context: context,
                              removeLeft: statusBar.onLeft,
                              removeRight: !statusBar.onLeft,
                              child: paddedContent,
                            );
                    },
                  ),
                ),
                if (statusBar != null && !statusBar.onLeft)
                  _buildStatusBarNavigationRail(destinations, statusBar.width),
              ],
            ),
            // 离线模式提示横幅（覆盖在顶部）
            _buildOfflineBanner(),
          ],
        ),
      );
      return useLiquidGlass
          ? LiquidGlassDockScope(
              notifier: _liquidDockExtent,
              child: landscapeScaffold,
            )
          : landscapeScaffold;
    }

    // 竖屏布局：液态玻璃模式把导航栏悬浮在页面内容上方，经典模式
    // 继续使用 Scaffold 的 bottomNavigationBar 插槽。
    final miniPlayer = Consumer(
      builder: (context, ref, child) {
        final currentTrack = ref.watch(currentTrackProvider);
        return currentTrack.when(
          data: (track) =>
              track != null ? const MiniPlayer() : const SizedBox.shrink(),
          loading: () => const SizedBox.shrink(),
          error: (_, __) => const SizedBox.shrink(),
        );
      },
    );
    final bottomNavigation = Consumer(
      child: miniPlayer,
      builder: (context, ref, child) {
        return MainBottomNavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: _handleDestinationSelected,
          destinations: destinations,
          liquidGlass: useLiquidGlass,
          fallbackGlassTransparency:
              ref.watch(fallbackGlassTransparencyProvider),
          showUpdateBadge: showUpdateBadge,
          onLayoutExtentChanged: (extent) {
            if (_liquidDockExtent.value != extent) {
              _liquidDockExtent.value = extent;
            }
          },
          miniPlayer: child!,
        );
      },
    );

    final portraitScaffold = Scaffold(
      body: Stack(
        children: [
          // 主内容
          Consumer(
            builder: (context, ref, child) {
              final authState = ref.watch(authProvider);
              final isOfflineMode = authState.currentUser != null &&
                  !authState.isLoggedIn &&
                  authState.error != null;

              return Padding(
                padding: EdgeInsets.only(top: isOfflineMode ? 30 : 0),
                child: SafeArea(
                  top: false,
                  bottom: false,
                  child: LiquidGlassDockMediaQuery(
                    child: _buildPages(),
                  ),
                ),
              );
            },
          ),
          // 离线模式提示横幅（覆盖在顶部）
          _buildOfflineBanner(),
          if (useLiquidGlass)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: bottomNavigation,
            ),
        ],
      ),
      bottomNavigationBar: useLiquidGlass ? null : bottomNavigation,
    );
    return useLiquidGlass
        ? LiquidGlassDockScope(
            notifier: _liquidDockExtent,
            child: portraitScaffold,
          )
        : portraitScaffold;
  }

  Widget _buildOfflineBanner() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Consumer(
        builder: (context, ref, child) {
          final authState = ref.watch(authProvider);
          final isOfflineMode = authState.currentUser != null &&
              !authState.isLoggedIn &&
              authState.error != null;

          if (!isOfflineMode) {
            return const SizedBox.shrink();
          }

          final topPadding = MediaQuery.of(context).padding.top;

          return Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(12, topPadding + 4, 12, 4),
            color: Colors.orange.shade800,
            child: Row(
              children: [
                const Icon(
                  Icons.cloud_off,
                  size: 14,
                  color: Colors.white,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    S.of(context).offlineModeMessage,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final notifier = ref.read(authProvider.notifier);
                    await notifier.retryConnection();
                  },
                  style: TextButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    S.of(context).retry,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  /// iOS 原生标签栏模式：导航由系统 UITabBarController 绘制，这里只画页面和
  /// 迷你播放器。系统把标签栏占用的区域作为安全区告诉 Flutter：普通 iPhone
  /// 是底部，iPhone Duo 是侧边的竖状态栏。
  Widget _buildNativeTabBarLayout(BuildContext context) {
    final viewPadding = MediaQuery.viewPaddingOf(context);
    // 底部安全区明显超过 Home 指示条（约 34pt）时，说明标签栏在底部，
    // 迷你播放器要浮在标签栏上方
    final dockBottomInset = viewPadding.bottom > 40
        ? viewPadding.bottom + 8
        : LiquidGlassLayout.dockBottomInset(context);

    final miniPlayer = Consumer(
      builder: (context, ref, child) {
        final currentTrack = ref.watch(currentTrackProvider);
        return currentTrack.when(
          data: (track) =>
              track != null ? const MiniPlayer() : const SizedBox.shrink(),
          loading: () => const SizedBox.shrink(),
          error: (_, __) => const SizedBox.shrink(),
        );
      },
    );

    return LiquidGlassDockScope(
      notifier: _liquidDockExtent,
      child: Scaffold(
        body: Stack(
          children: [
            Consumer(
              builder: (context, ref, child) {
                final authState = ref.watch(authProvider);
                final isOfflineMode = authState.currentUser != null &&
                    !authState.isLoggedIn &&
                    authState.error != null;

                return Padding(
                  padding: EdgeInsets.only(top: isOfflineMode ? 30 : 0),
                  child: SafeArea(
                    top: false,
                    bottom: false,
                    child: LiquidGlassDockOverlay(
                      bottomInset: dockBottomInset,
                      onExtentChanged: (extent) {
                        if (_liquidDockExtent.value != extent) {
                          _liquidDockExtent.value = extent;
                        }
                      },
                      dock: AnimatedSize(
                        duration: const Duration(milliseconds: 180),
                        curve: Curves.easeOutCubic,
                        alignment: Alignment.bottomCenter,
                        child: miniPlayer,
                      ),
                      child: _buildPages(),
                    ),
                  ),
                );
              },
            ),
            _buildOfflineBanner(),
          ],
        ),
      ),
    );
  }

  /// iPhone Duo：导航竖排在侧边状态栏中，宽度等于状态栏，垂直居中，
  /// 落在时间和 Wi-Fi 图标下方，和系统 app 的做法一致。
  Widget _buildStatusBarNavigationRail(
    List<NavigationDestination> destinations,
    double width,
  ) {
    return SizedBox(
      width: width,
      child: MediaQuery.removePadding(
        context: context,
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        child: NavigationRail(
          selectedIndex: _currentIndex,
          onDestinationSelected: _handleDestinationSelected,
          minWidth: width,
          groupAlignment: 0.0,
          backgroundColor: Colors.transparent,
          labelType: NavigationRailLabelType.selected,
          destinations: destinations
              .map((dest) => NavigationRailDestination(
                    icon: dest.icon,
                    selectedIcon: dest.selectedIcon,
                    label: Text(dest.label),
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildNavigationRail(List<NavigationDestination> destinations) {
    return NavigationRail(
      selectedIndex: _currentIndex,
      onDestinationSelected: _handleDestinationSelected,
      labelType: NavigationRailLabelType.selected,
      destinations: destinations
          .map((dest) => NavigationRailDestination(
                icon: dest.icon,
                selectedIcon: dest.selectedIcon,
                label: Text(dest.label),
              ))
          .toList(),
    );
  }
}
