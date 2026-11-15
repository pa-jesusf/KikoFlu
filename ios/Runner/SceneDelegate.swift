import Flutter
import UIKit

class SceneDelegate: FlutterSceneDelegate {
  private var nativeTabBarHost: NativeTabBarHost?

  override func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    super.scene(scene, willConnectTo: session, options: connectionOptions)
    guard let window, let host = NativeTabBarHost.install(in: window) else { return }
    host.onFlutterViewMoved = {
      (UIApplication.shared.delegate as? AppDelegate)?.flutterViewDidMove()
    }
    nativeTabBarHost = host
  }
}
