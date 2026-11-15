import 'package:flutter/widgets.dart';

/// Moves the main pages below the offline banner that MainScreen draws over
/// the top of the window.
///
/// The pages take over the top safe area: the banner already covers it, and
/// leaving it in place would make pages that put their toolbar inside a tall
/// status bar (iPhone Duo unfolded, see
/// `FloatingToolbarLayout.topStatusBarSlot`) draw it under the banner.
/// Elsewhere the content ends up where it was before: 30pt lower than online.
class OfflineBannerInset extends StatelessWidget {
  const OfflineBannerInset({
    super.key,
    required this.offline,
    required this.child,
  });

  /// Space the banner takes below the top safe area.
  static const double bannerExtent = 30;

  final bool offline;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // Keep the same structure online and offline so page state is preserved.
    final top = offline ? MediaQuery.paddingOf(context).top + bannerExtent : 0.0;
    return Padding(
      padding: EdgeInsets.only(top: top),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: offline,
        child: child,
      ),
    );
  }
}
