import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../services/duo_layout.dart';
import 'floating_feed_toolbar.dart';

/// Places an app bar where iPhone Duo wants bars:
///
/// - Held upright while unfolded, inside the status bar row at the top,
///   clear of the time and Wi-Fi, with the page starting below the row.
/// - Folded or held sideways, on a page pushed over the main screen (the tab
///   bar is hidden), the back button and icon actions move into the vertical
///   bar beside the content, top first, and the app bar keeps the title.
///   Actions that are not plain icon buttons stay in the app bar.
///
/// Elsewhere [appBar] is used as it is.
class TopStatusBarAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const TopStatusBarAppBar({super.key, required this.appBar});

  final AppBar appBar;

  @override
  Size get preferredSize => appBar.preferredSize;

  @override
  Widget build(BuildContext context) {
    return adapt(context, appBar, height: appBar.preferredSize.height);
  }

  /// Adapts [appBar], whose content including any bottom is [height] tall.
  static Widget adapt(
    BuildContext context,
    AppBar appBar, {
    required double height,
  }) {
    final layout = DuoLayout.of(context);
    final sideBar = layout?.sideBar;
    if (layout != null &&
        layout.hasVerticalBar &&
        sideBar != null &&
        layout.tabBar == null) {
      final split = _splitForSideBar(context, appBar);
      if (split == null) return appBar;
      return _SideBarAppBar(
        appBar: split.appBar,
        items: split.items,
        region: sideBar,
      );
    }

    final slot = FloatingToolbarLayout.topStatusBarSlot(
      context,
      height: appBar.toolbarHeight ?? kToolbarHeight,
    );
    if (slot == null) return appBar;
    final mediaQuery = MediaQuery.of(context);
    EdgeInsets inStatusBar(EdgeInsets padding) => padding.copyWith(
      top: slot.top,
      right: math.max(padding.right, slot.right),
    );
    // Scaffold reserves the full inset above the bar; the fixed height lets
    // the page start right below the bar instead, but never inside the status
    // bar row, where content on the right would run into the time and Wi-Fi.
    return SizedBox(
      height: math.max(slot.top + height, mediaQuery.padding.top),
      child: MediaQuery(
        data: mediaQuery.copyWith(
          padding: inStatusBar(mediaQuery.padding),
          viewPadding: inStatusBar(mediaQuery.viewPadding),
        ),
        child: appBar,
      ),
    );
  }

  /// The leading button and icon actions to move into the vertical bar, and
  /// [appBar] without them. Null when there is nothing to move.
  static ({AppBar appBar, List<Widget> items})? _splitForSideBar(
    BuildContext context,
    AppBar appBar,
  ) {
    final items = <Widget>[];
    var leading = appBar.leading;
    if (leading == null && appBar.automaticallyImplyLeading) {
      final route = ModalRoute.of(context);
      if (route?.impliesAppBarDismissal ?? false) {
        leading = route is PageRoute && route.fullscreenDialog
            ? const CloseButton()
            : const BackButton();
      }
    }
    if (leading != null) items.add(leading);
    final kept = <Widget>[];
    for (final action in appBar.actions ?? const <Widget>[]) {
      (_isIconAction(action) ? items : kept).add(action);
    }
    if (items.isEmpty) return null;
    return (
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: appBar.title,
        actions: kept,
        flexibleSpace: appBar.flexibleSpace,
        bottom: appBar.bottom,
        elevation: appBar.elevation,
        scrolledUnderElevation: appBar.scrolledUnderElevation,
        notificationPredicate: appBar.notificationPredicate,
        shadowColor: appBar.shadowColor,
        surfaceTintColor: appBar.surfaceTintColor,
        shape: appBar.shape,
        backgroundColor: appBar.backgroundColor,
        foregroundColor: appBar.foregroundColor,
        iconTheme: appBar.iconTheme,
        actionsIconTheme: appBar.actionsIconTheme,
        primary: appBar.primary,
        centerTitle: appBar.centerTitle,
        excludeHeaderSemantics: appBar.excludeHeaderSemantics,
        titleSpacing: appBar.titleSpacing,
        toolbarOpacity: appBar.toolbarOpacity,
        bottomOpacity: appBar.bottomOpacity,
        toolbarHeight: appBar.toolbarHeight,
        toolbarTextStyle: appBar.toolbarTextStyle,
        titleTextStyle: appBar.titleTextStyle,
        systemOverlayStyle: appBar.systemOverlayStyle,
        forceMaterialTransparency: appBar.forceMaterialTransparency,
        clipBehavior: appBar.clipBehavior,
      ),
      items: items,
    );
  }

  /// Only icon buttons fit the vertical bar; text buttons and custom views
  /// stay in the app bar.
  static bool _isIconAction(Widget action) {
    Widget? widget = action;
    while (widget is Padding || widget is Tooltip) {
      widget = widget is Padding ? widget.child : (widget as Tooltip).child;
    }
    return widget is IconButton ||
        widget is PopupMenuButton ||
        widget is BackButton ||
        widget is CloseButton;
  }
}

/// An app bar whose buttons are drawn inside the vertical bar. They are
/// painted above this page and below any page pushed on top of it, and fade
/// with the page's transition.
class _SideBarAppBar extends StatefulWidget {
  const _SideBarAppBar({
    required this.appBar,
    required this.items,
    required this.region,
  });

  final AppBar appBar;
  final List<Widget> items;
  final Rect region;

  @override
  State<_SideBarAppBar> createState() => _SideBarAppBarState();
}

class _SideBarAppBarState extends State<_SideBarAppBar> {
  final OverlayPortalController _controller = OverlayPortalController();

  @override
  void initState() {
    super.initState();
    _controller.show();
  }

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: _controller,
      overlayChildBuilder: (context) {
        final animation =
            ModalRoute.of(context)?.animation ?? kAlwaysCompleteAnimation;
        final iconTheme =
            widget.appBar.iconTheme ??
            AppBarTheme.of(context).iconTheme ??
            IconThemeData(color: Theme.of(context).colorScheme.onSurface);
        return Positioned.fromRect(
          rect: widget.region,
          child: FadeTransition(
            opacity: animation,
            child: Align(
              alignment: Alignment.topCenter,
              // The same glass capsule as the floating toolbars, so the
              // buttons stay legible over header images that run under the
              // vertical bar.
              child: FloatingToolbarSurface(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: IconTheme.merge(
                  data: iconTheme,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (final item in widget.items)
                          SizedBox.square(
                            dimension: widget.region.width,
                            child: Center(child: item),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      child: widget.appBar,
    );
  }
}
