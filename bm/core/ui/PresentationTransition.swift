 import Foundation
 import UIKit

 class PresentationTransition {
     
     typealias Result = () -> Void
     
     static func animate(view: UIView, with area: CGRect, done: @escaping Result) {
         view.frame.origin = CGPoint(x: -area.size.width, y: 0)
         UIView.animate(withDuration: 0.2, animations: {
             view.frame.origin = CGPoint(x:0, y: 0)
         }, completion: { (finished) in
             if (finished){
                 done()
             }
         })
     }
 }