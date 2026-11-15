import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// Which side of the window holds iPhone Duo's vertical bar.
enum VerticalBarEdge { none, left, right }

/// A region the system reserves: the camera and status bar (occlusion) or
/// the fold (division). [active] tells whether it applies right now.
@immutable
class ReservedRegion {
  const ReservedRegion(this.rect, {required this.active});

  final Rect rect;
  final bool active;

  @override
  bool operator ==(Object other) =>
      other is ReservedRegion && other.rect == rect && other.active == active;

  @override
  int get hashCode => Object.hash(rect, active);
}

/// How iPhone Duo lays out the window, as reported by UIKit
/// (`DuoLayoutReporter.swift`). Fields are null where the system gives no
/// value, e.g. before iOS 27.1 or off iOS.
@immutable
class DuoLayoutData {
  const DuoLayoutData({
    required this.viewSize,
    this.verticalBarEdge,
    this.topBar,
    this.sideBar,
    this.tabBar,
    this.occlusions = const [],
    this.divisions = const [],
  });

  /// Height of the bars [topBar] and [sideBar] were measured for.
  static const double barExtent = 48;

  final Size viewSize;

  /// Null when the system does not say (older iOS).
  final VerticalBarEdge? verticalBarEdge;

  /// Insets for a top bar of [barExtent]; only top, left and right are used.
  final EdgeInsets? topBar;

  /// Where bars of [barExtent] go inside the vertical bar.
  final Rect? sideBar;

  /// The native tab bar while it is shown.
  final Rect? tabBar;

  final List<ReservedRegion> occlusions;
  final List<ReservedRegion> divisions;

  bool get hasVerticalBar =>
      verticalBarEdge != null && verticalBarEdge != VerticalBarEdge.none;

  static DuoLayoutData? _fromMap(Map<Object?, Object?>? map) {
    if (map == null) return null;
    double number(Map<Object?, Object?> m, String key) =>
        (m[key] as num?)?.toDouble() ?? 0;
    Rect? rect(Object? value) {
      if (value is! Map) return null;
      return Rect.fromLTWH(
        number(value, 'x'),
        number(value, 'y'),
        number(value, 'width'),
        number(value, 'height'),
      );
    }

    List<ReservedRegion> regions(Object? value) => [
      if (value is List)
        for (final entry in value.whereType<Map>())
          ReservedRegion(rect(entry)!, active: entry['active'] != false),
    ];

    final topBar = map['topBar'];
    return DuoLayoutData(
      viewSize: Size(number(map, 'width'), number(map, 'height')),
      verticalBarEdge: switch (map['verticalBarEdge']) {
        'left' => VerticalBarEdge.left,
        'right' => VerticalBarEdge.right,
        'none' => VerticalBarEdge.none,
        _ => null,
      },
      topBar: topBar is Map
          ? EdgeInsets.only(
              top: number(topBar, 'top'),
              left: number(topBar, 'left'),
              right: number(topBar, 'right'),
            )
          : null,
      sideBar: rect(map['sideBar']),
      tabBar: rect(map['tabBar']),
      occlusions: regions(map['occlusions']),
      divisions: regions(map['divisions']),
    );
  }

  @override
  bool operator ==(Object other) =>
      other is DuoLayoutData &&
      other.viewSize == viewSize &&
      other.verticalBarEdge == verticalBarEdge &&
      other.topBar == topBar &&
      other.sideBar == sideBar &&
      other.tabBar == tabBar &&
      listEquals(other.occlusions, occlusions) &&
      listEquals(other.divisions, divisions);

  @override
  int get hashCode => Object.hash(
    viewSize,
    verticalBarEdge,
    topBar,
    sideBar,
    tabBar,
    Object.hashAll(occlusions),
    Object.hashAll(divisions),
  );
}

/// Provides [DuoLayoutData] to the widgets below it. Native code sends a new
/// value whenever the layout changes (rotating, folding, unfolding, showing
/// or hiding the tab bar), and dependents rebuild.
class DuoLayout extends InheritedNotifier<ValueNotifier<DuoLayoutData?>> {
  DuoLayout({super.key, required super.child}) : super(notifier: _data);

  static const MethodChannel _channel = MethodChannel(
    'com.meteor.kikoeruflutter/duo_layout',
  );
  static final ValueNotifier<DuoLayoutData?> _data = ValueNotifier(null);
  static bool _initialized = false;

  /// Starts listening. Call before runApp.
  static Future<void> initialize() async {
    if (!Platform.isIOS || _initialized) return;
    _initialized = true;
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'update') {
        _data.value = DuoLayoutData._fromMap(call.arguments as Map?);
      }
    });
    try {
      final current = await _channel.invokeMapMethod<Object?, Object?>(
        'current',
      );
      _data.value ??= DuoLayoutData._fromMap(current);
    } on MissingPluginException {
      // Not hosted by the native tab bar (iPad, older iOS): no data.
    }
  }

  /// The layout of the window [context] belongs to, or null when there is
  /// none or it was measured before the window changed size.
  static DuoLayoutData? of(BuildContext context) {
    final data = context
        .dependOnInheritedWidgetOfExactType<DuoLayout>()
        ?.notifier
        ?.value;
    if (data == null) return null;
    final view = View.of(context);
    final windowSize = view.physicalSize / view.devicePixelRatio;
    final sameSize =
        (data.viewSize.width - windowSize.width).abs() < 0.5 &&
        (data.viewSize.height - windowSize.height).abs() < 0.5;
    return sameSize ? data : null;
  }
}
