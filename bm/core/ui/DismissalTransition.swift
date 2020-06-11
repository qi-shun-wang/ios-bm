import Foundation
import UIKit

class DismissalTransition {
    
    typealias Result = () -> Void
    
    static func animate(view: UIView, with area: CGRect, done: @escaping Result) {
        UIView.animate(withDuration: 2, animations: {
            view.frame.origin = CGPoint(x:0, y: -area.size.height)
        }, completion: { (finished) in
            if (finished){
                done()
            }
        })
    }
}