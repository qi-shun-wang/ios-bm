import UIKit

class MusicPlayerView: UIView {
    
    var eventHandler: MusicPlayerModuleInterface?
    var transitionDelegate: ViewTransitionDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initChildView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initChildView()
    }
    
    func initChildView(){
        let hello_world = UILabel(frame: frame)
        hello_world.text = "Hello World"
        hello_world.textAlignment = .center
        addSubview(hello_world)
        backgroundColor = .white
    }
    
    deinit {
        print("deinit-->SwiftTemplate")
    }
    
}

extension MusicPlayerView: MusicPlayerViewInterface {
    
    func present() {
        transitionDelegate?.shouldAttachToSuperview()
    }
    
    func dismiss() {
        transitionDelegate?.shouldRemoveFromSuperview()
    }
    
}
