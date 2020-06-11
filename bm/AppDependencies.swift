import Foundation
import UIKit

/*
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let appDependencies = AppDependencies()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = RootViewController(dependency: appDependencies)
        return true
}
 */
final class AppDependencies {
    
    private let assembler = AppModuleAssembler()
    var manager: PlayerManagerInterface!
    init() {
        configureDependencies()
    }
    
    func installRootView(root: UIView) {
		assembler.musicPlayerWireframe.configure(parent: root)

		assembler.musicPlayerWireframe.presentMusicPlayerViewFromParent()

        
    }
    
    func uninstallRootView() {
		assembler.musicPlayerWireframe.dismissMusicPlayerViewFromParent()

    }
    
    func configureDependencies() {
		let musicPlayerDataManager = MusicPlayerDataManager()

        manager = PlayerManager()
        manager.play()
		assembler.setupMusicPlayerModule(musicPlayerDataManager: musicPlayerDataManager)

    }
}

