#if os(iOS)
import UIKit
import Foundation

extension UIView: BaseView {
    public func run(action: @escaping UIView.Main) {
        DispatchQueue.main.async{
            action()
        }
    }
}
#endif