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

  // Main screens that want the tab bar, oldest first; the last one drives it.
  // Signing in briefly builds two main screens (the pushed route and the
  // rebuilt home route), and either may be disposed first, so when the
  // driving screen goes away the previous one takes over again.
  static final List<_TabBarOwner> _owners = [];

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
        final index = call.arguments as int;
        _lastIndex = index;
        final owner = _owners.isEmpty ? null : _owners.last;
        owner?.index = index;
        owner?.onSelect(index);
      }
    });
  }

  /// Lets [owner] drive the tab bar, showing [index] as selected, and sends
  /// it the tabs the user picks until it calls [detach].
  static void attach(Object owner, ValueChanged<int> onSelect, int index) {
    _owners.removeWhere((o) => identical(o.owner, owner));
    _owners.add(_TabBarOwner(owner, onSelect, index));
    _apply();
  }

  /// Hands the tab bar back to the previous main screen, or hides it when
  /// none is left.
  static void detach(Object owner) {
    _owners.removeWhere((o) => identical(o.owner, owner));
    _apply();
  }

  static void setTabBarHidden(Object owner, bool hidden) {
    _ownerEntry(owner)?.hidden = hidden;
    _apply();
  }

  static _TabBarOwner? _ownerEntry(Object owner) {
    for (final o in _owners) {
      if (identical(o.owner, owner)) return o;
    }
    return null;
  }

  static void _apply() {
    if (!_isActive) return;
    if (_owners.isEmpty) {
      _sendHidden(true);
      return;
    }
    final current = _owners.last;
    if (_lastIndex != current.index) {
      _lastIndex = current.index;
      _invoke('setSelectedIndex', current.index);
    }
    _sendHidden(current.hidden);
  }

  static void _sendHidden(bool hidden) {
    if (_lastHidden == hidden) return;
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

class _TabBarOwner {
  _TabBarOwner(this.owner, this.onSelect, this.index);

  final Object owner;
  final ValueChanged<int> onSelect;
  int index;

  /// Hidden while a page is pushed on top of this main screen.
  bool hidden = false;
}
