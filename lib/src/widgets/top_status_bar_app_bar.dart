import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'floating_feed_toolbar.dart';

/// Puts [appBar] inside iPhone Duo's top status bar when the unfolded phone is
/// held upright: vertically centred in it, kept clear of the time and Wi-Fi,
/// with the page starting right below the bar. Elsewhere [appBar] is used as
/// it is.
class TopStatusBarAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const TopStatusBarAppBar({super.key, required this.appBar});

  final PreferredSizeWidget appBar;

  @override
  Size get preferredSize => appBar.preferredSize;

  @override
  Widget build(BuildContext context) {
    return wrap(context, appBar, height: appBar.preferredSize.height);
  }

  /// Wraps an app bar whose content, including any bottom, is [height] tall
  /// and whose toolbar is [toolbarHeight] tall.
  static Widget wrap(
    BuildContext context,
    Widget appBar, {
    required double height,
    double toolbarHeight = kToolbarHeight,
  }) {
    final slot = FloatingToolbarLayout.topStatusBarSlot(
      context,
      height: toolbarHeight,
    );
    if (slot == null) return appBar;
    final mediaQuery = MediaQuery.of(context);
    EdgeInsets inStatusBar(EdgeInsets padding) => padding.copyWith(
      top: slot.top,
      right: padding.right > slot.right ? padding.right : slot.right,
    );
    // Scaffold reserves the full inset above the bar; the fixed height lets
    // the page start right below the bar instead, but never inside the status
    // bar, where content on the right would run into the time and Wi-Fi.
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
}
