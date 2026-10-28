import Flutter
import UIKit

/// Hosts the single Flutter view inside a system `UITabBarController`, so
/// iPhone users get the native Liquid Glass tab bar: at the bottom on
/// ordinary iPhones, and inside the vertical status bar on iPhone Duo.
///
/// Flutter keeps drawing every page; only the tab bar is native. The Flutter
/// view controller moves into the selected tab's container, and Dart decides
/// when the bar shows (main screen) or hides (pushed pages, login).
final class NativeTabBarHost: NSObject, UITabBarControllerDelegate {
  static let channelName = "com.meteor.kikoeruflutter/native_tabs"

  /// Installs the host as the window's root view controller when the device
  /// supports it. Returns nil (leaving Flutter's own navigation in place) on
  /// iPad and on systems without the Liquid Glass tab bar.
  static func install(in window: UIWindow) -> NativeTabBarHost? {
    guard #available(iOS 26.0, *),
          UIDevice.current.userInterfaceIdiom == .phone,
          let flutterController = window.rootViewController as? FlutterViewController else {
      return nil
    }
    let host = NativeTabBarHost(flutterController: flutterController)
    window.rootViewController = host.tabBarController
    return host
  }

  /// Called after the Flutter view moves into another tab's container.
  var onFlutterViewMoved: (() -> Void)?

  let tabBarController = UITabBarController()
  private let flutterController: FlutterViewController
  private let channel: FlutterMethodChannel
  private let containers: [FlutterTabContainer]

  @available(iOS 26.0, *)
  private init(flutterController: FlutterViewController) {
    self.flutterController = flutterController
    channel = FlutterMethodChannel(
      name: NativeTabBarHost.channelName,
      binaryMessenger: flutterController.binaryMessenger
    )
    // Titles are replaced by localized ones from Dart once it starts.
    let items: [(String, String, String)] = [
      ("Home", "house", "house.fill"),
      ("Search", "magnifyingglass", "magnifyingglass"),
      ("My", "heart", "heart.fill"),
      ("Settings", "gearshape", "gearshape.fill"),
    ]
    containers = items.map { title, symbol, selectedSymbol in
      let container = FlutterTabContainer()
      container.tabBarItem = UITabBarItem(
        title: title,
        image: UIImage(systemName: symbol),
        selectedImage: UIImage(systemName: selectedSymbol)
      )
      return container
    }
    super.init()

    tabBarController.viewControllers = containers
    tabBarController.delegate = self
    // Hidden until the Flutter main screen asks for it (not on login).
    tabBarController.setTabBarHidden(true, animated: false)
    embedFlutter(in: containers[0])

    channel.setMethodCallHandler { [weak self] call, result in
      self?.handle(call, result: result)
    }
  }

  private func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "isActive":
      result(true)
    case "setSelectedIndex":
      guard let index = call.arguments as? Int, containers.indices.contains(index) else {
        result(FlutterError(code: "bad_args", message: "Invalid tab index", details: nil))
        return
      }
      if tabBarController.selectedIndex != index {
        tabBarController.selectedIndex = index
        embedFlutter(in: containers[index])
      }
      result(nil)
    case "setTabBarHidden":
      let hidden = call.arguments as? Bool ?? false
      if #available(iOS 18.0, *), tabBarController.isTabBarHidden != hidden {
        tabBarController.setTabBarHidden(hidden, animated: true)
      }
      result(nil)
    case "setTitles":
      let titles = call.arguments as? [String] ?? []
      for (container, title) in zip(containers, titles) {
        container.tabBarItem.title = title
      }
      result(nil)
    case "setBadge":
      let args = call.arguments as? [String: Any]
      if let index = args?["index"] as? Int, containers.indices.contains(index) {
        let visible = args?["visible"] as? Bool ?? false
        // An empty badge value draws the system dot without a number.
        containers[index].tabBarItem.badgeValue = visible ? "" : nil
      }
      result(nil)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  func tabBarController(
    _ tabBarController: UITabBarController,
    didSelect viewController: UIViewController
  ) {
    // Move the Flutter view only after UIKit has put the new container on
    // screen; moving it earlier leaves the new tab blank.
    guard let index = containers.firstIndex(where: { $0 === viewController }) else { return }
    embedFlutter(in: containers[index])
    channel.invokeMethod("select", arguments: index)
  }

  private func embedFlutter(in container: FlutterTabContainer) {
    guard flutterController.parent !== container else { return }
    flutterController.willMove(toParent: nil)
    flutterController.view.removeFromSuperview()
    flutterController.removeFromParent()

    container.addChild(flutterController)
    flutterController.view.frame = container.view.bounds
    flutterController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    container.view.addSubview(flutterController.view)
    flutterController.didMove(toParent: container)
    onFlutterViewMoved?()
  }
}

/// A tab's content view controller. It forwards appearance callbacks to the
/// Flutter view controller only for the first appearance: later tab switches
/// move the same, still visible Flutter view between containers, and
/// forwarding them would report the app as inactive or paused on every tap.
private final class FlutterTabContainer: UIViewController {
  private static var flutterHasAppeared = false

  override var shouldAutomaticallyForwardAppearanceMethods: Bool { false }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    if !Self.flutterHasAppeared {
      children.forEach { $0.beginAppearanceTransition(true, animated: animated) }
    }
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if !Self.flutterHasAppeared, !children.isEmpty {
      children.forEach { $0.endAppearanceTransition() }
      Self.flutterHasAppeared = true
    }
  }
}
