import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// Bridge to the native iOS tab bar (`NativeTabBarHost.swift`).
///
/// On iPhone with iOS 26+, the app's root is a system `UITabBarController`
/// whose Liquid Glass tab bar replaces Flutter's own navigation: at the bottom
/// on ordinary iPhones, and inside the vertical status bar on iPhone Duo.
/// Everywhere else [isActive] stays false and Flutter draws the navigation.
class NativeTabBarService {
  static const MethodChannel _channel =
      MethodChannel('com.meteor.kikoeruflutter/native_tabs');

  /// Pages pushed on top of the main screen hide the tab bar through this
  /// observer; see [MainScreen].
  static final RouteObserver<PageRoute<dynamic>> routeObserver =
      RouteObserver<PageRoute<dynamic>>();

  static bool _isActive = false;
  static bool get isActive => _isActive;

  static ValueChanged<int>? _onSelect;

  static bool? _lastHidden;
  static int? _lastIndex;
  static List<String>? _lastTitles;
  static bool? _lastBadge;

  /// Asks the native side whether it hosts the tab bar. Call before runApp so
  /// the first frame already uses the right layout.
  static Future<void> initialize() async {
    if (!Platform.isIOS) return;
    try {
      _isActive = await _channel.invokeMethod<bool>('isActive') ?? false;
    } on MissingPluginException {
      _isActive = false;
    } on PlatformException catch (e) {
      debugPrint('Native tab bar unavailable: ${e.message}');
      _isActive = false;
    }
    if (!_isActive) return;
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'select' && call.arguments is int) {
        _lastIndex = call.arguments as int;
        _onSelect?.call(_lastIndex!);
      }
    });
  }

  /// Receives the tab the user picked in the native tab bar.
  static set onSelect(ValueChanged<int>? callback) => _onSelect = callback;

  static void setSelectedIndex(int index) {
    if (!_isActive || _lastIndex == index) return;
    _lastIndex = index;
    _invoke('setSelectedIndex', index);
  }

  static void setTabBarHidden(bool hidden) {
    if (!_isActive || _lastHidden == hidden) return;
    _lastHidden = hidden;
    _invoke('setTabBarHidden', hidden);
  }

  static void setTitles(List<String> titles) {
    if (!_isActive || listEquals(_lastTitles, titles)) return;
    _lastTitles = titles;
    _invoke('setTitles', titles);
  }

  static void setBadge(int index, bool visible) {
    if (!_isActive || _lastBadge == visible) return;
    _lastBadge = visible;
    _invoke('setBadge', {'index': index, 'visible': visible});
  }

  static Future<void> _invoke(String method, Object? arguments) async {
    try {
      await _channel.invokeMethod<void>(method, arguments);
    } on PlatformException catch (e) {
      debugPrint('Native tab bar $method failed: ${e.message}');
    }
  }
}
