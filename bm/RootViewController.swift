import UIKit

class RootViewController: UIViewController {
    weak var dependency: AppDependencies!
    
    convenience init(dependency: AppDependencies) {
        self.init()
        self.dependency = dependency
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dependency.installRootView(root: view)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        dependency.uninstallRootView()
    }
}