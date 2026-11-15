import Flutter
import UIKit

/// Tells Flutter how iPhone Duo lays out the window, using the values UIKit
/// gives rather than guessing them from safe areas:
///
/// - `verticalBarEdge`: "left" or "right" when the system puts bars in a
///   vertical bar beside the content (folded, or held sideways), else "none".
/// - `topBar`: where a top bar of `barExtent` goes along the top edge. Held
///   upright while unfolded, this sits inside the status bar row, clear of the
///   time and Wi-Fi.
/// - `sideBar`: where bars of `barExtent` go inside the vertical bar.
/// - `tabBar`: the native tab bar's frame while it is shown.
/// - `occlusions` / `divisions`: regions reserved by the camera and status bar,
///   and by the fold, each with whether it is active.
///
/// Values are read after layout, sent only when they change, and kept from
/// before the app hid the status bar so bars do not jump while it is hidden.
/// The iOS 27.1 APIs are reached through the Objective-C runtime so the app
/// still builds with older SDKs; there every field but the size is absent.
final class DuoLayoutReporter {
  static let channelName = "com.meteor.kikoeruflutter/duo_layout"
  static let barExtent: CGFloat = 48

  private let channel: FlutterMethodChannel
  private var lastSnapshot: [String: Any]?

  init(messenger: FlutterBinaryMessenger) {
    channel = FlutterMethodChannel(name: Self.channelName, binaryMessenger: messenger)
    channel.setMethodCallHandler { [weak self] call, result in
      guard call.method == "current" else {
        result(FlutterMethodNotImplemented)
        return
      }
      result(self?.lastSnapshot)
    }
  }

  /// Measures [view] (the Flutter view) and sends the result if it changed.
  func report(view: UIView, tabBar: UITabBar?) {
    guard view.window != nil, view.bounds.width > 0 else { return }
    var snapshot = measure(view: view, tabBar: tabBar)
    let statusBarHidden = view.window?.windowScene?.statusBarManager?.isStatusBarHidden ?? false
    if statusBarHidden, let last = lastSnapshot,
       last["width"] as? Double == snapshot["width"] as? Double,
       last["height"] as? Double == snapshot["height"] as? Double {
      snapshot["topBar"] = last["topBar"]
      snapshot["occlusions"] = last["occlusions"]
    }
    if let last = lastSnapshot, NSDictionary(dictionary: last).isEqual(to: snapshot) { return }
    lastSnapshot = snapshot
    channel.invokeMethod("update", arguments: snapshot)
  }

  private func measure(view: UIView, tabBar: UITabBar?) -> [String: Any] {
    let size = view.bounds.size
    var snapshot: [String: Any] = [
      "width": Double(size.width),
      "height": Double(size.height),
    ]

    if let edge = Self.verticalBarEdge(of: view) {
      snapshot["verticalBarEdge"] = edge
      if edge != "none", let sideInsets = Self.barInsets(
        in: view, edge: edge == "right" ? .right : .left, extent: Self.barExtent
      ) {
        let x = edge == "right"
          ? size.width - sideInsets.right - Self.barExtent
          : sideInsets.left
        snapshot["sideBar"] = Self.rect(CGRect(
          x: x, y: sideInsets.top, width: Self.barExtent,
          height: size.height - sideInsets.top - sideInsets.bottom))
      }
    }
    if let top = Self.barInsets(in: view, edge: .top, extent: Self.barExtent) {
      snapshot["topBar"] = [
        "top": Double(top.top), "left": Double(top.left), "right": Double(top.right),
      ]
    }
    if let tabBar, tabBar.window != nil, !tabBar.isHidden, tabBar.alpha > 0 {
      snapshot["tabBar"] = Self.rect(tabBar.convert(tabBar.bounds, to: view))
    }
    if let occlusions = Self.reservedRegions(in: view, kind: "occlusionRegionKind") {
      snapshot["occlusions"] = occlusions
    }
    if let divisions = Self.reservedRegions(in: view, kind: "divisionRegionKind") {
      snapshot["divisions"] = divisions
    }
    return snapshot
  }

  private static func rect(_ rect: CGRect) -> [String: Double] {
    [
      "x": Double(rect.minX), "y": Double(rect.minY),
      "width": Double(rect.width), "height": Double(rect.height),
    ]
  }

  // MARK: iOS 27.1 APIs through the runtime

  /// `traitCollection.verticalBarEdge` as "left", "right" or "none".
  private static func verticalBarEdge(of view: UIView) -> String? {
    let traits = view.traitCollection
    guard traits.responds(to: NSSelectorFromString("verticalBarEdge")),
          let raw = traits.value(forKey: "verticalBarEdge") as? Int else { return nil }
    // UIVerticalBarEdge: 0 unspecified, 1 leading, 2 trailing.
    guard raw == 1 || raw == 2 else { return "none" }
    let leading = raw == 1
    let rightToLeft = view.effectiveUserInterfaceLayoutDirection == .rightToLeft
    return leading != rightToLeft ? "left" : "right"
  }

  /// `view.edgeInsets(for: .bar(onEdge: edge, extent: extent))`.
  private static func barInsets(in view: UIView, edge: UIRectEdge, extent: CGFloat) -> UIEdgeInsets? {
    let makeRegion = NSSelectorFromString("layoutRegionForBarOnEdge:extent:")
    let insetsForRegion = NSSelectorFromString("edgeInsetsForLayoutRegion:")
    guard let regionClass = NSClassFromString("UIViewLayoutRegion"),
          let metaclass = object_getClass(regionClass),
          class_respondsToSelector(metaclass, makeRegion),
          view.responds(to: insetsForRegion) else { return nil }

    typealias MakeRegion = @convention(c) (AnyClass, Selector, UInt, CGFloat) -> AnyObject
    typealias InsetsForRegion = @convention(c) (UIView, Selector, AnyObject) -> UIEdgeInsets
    let make = unsafeBitCast(
      class_getMethodImplementation(metaclass, makeRegion), to: MakeRegion.self)
    let insets = unsafeBitCast(view.method(for: insetsForRegion), to: InsetsForRegion.self)
    let region = make(regionClass, makeRegion, edge.rawValue, extent)
    return insets(view, insetsForRegion, region)
  }

  /// `view.reservedRegions(kind:options: .includeInactive)` as frames with
  /// their active state.
  private static func reservedRegions(in view: UIView, kind kindFactory: String) -> [[String: Any]]? {
    let query = NSSelectorFromString("reservedRegionsOfKind:options:")
    let factory = NSSelectorFromString(kindFactory)
    guard let kindClass = NSClassFromString("UIViewReservedRegionKind") as AnyObject?,
          kindClass.responds(to: factory),
          view.responds(to: query),
          let kind = kindClass.perform(factory)?.takeUnretainedValue() else { return nil }

    typealias Query = @convention(c) (UIView, Selector, AnyObject, UInt) -> NSArray
    let regions = unsafeBitCast(view.method(for: query), to: Query.self)(
      view, query, kind, 1 /* includeInactive */)
    return regions.compactMap { region -> [String: Any]? in
      guard let region = region as? NSObject,
            let frame = (region.value(forKey: "frame") as? NSValue)?.cgRectValue else { return nil }
      var entry: [String: Any] = rect(frame)
      entry["active"] = (region.value(forKey: "active") as? Bool) ?? true
      return entry
    }
  }
}
