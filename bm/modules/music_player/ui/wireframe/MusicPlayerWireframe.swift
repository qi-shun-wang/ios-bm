import UIKit

class MusicPlayerWireframe : BaseRouting {
    typealias Presenter = (MusicPlayerPresenterInterface&MusicPlayerModuleInterface)
    
    typealias ParentView = UIView
    private var presenter: Presenter?
    private weak var parent: ParentView!
    private var musicPlayerView: MusicPlayerView!
    
    func configure(parent: ParentView) {
        self.parent = parent
    }
    
    func configure(presenter: Presenter) {
        self.presenter = presenter
    }
    
    func presentViewFromParent() {
        if musicPlayerView != nil {return} // lock the duplicate action
        let frame = parent.frame
        musicPlayerView = MusicPlayerView(frame: frame)
        musicPlayerView.transitionDelegate = self
        musicPlayerView.eventHandler = presenter
        
        parent.addSubview(musicPlayerView)
        presenter?.attachView(view: musicPlayerView)
    }
    
    func dismissViewFromParent() {
        presenter?.detachView()
    }
    
}

extension MusicPlayerWireframe: MusicPlayerWireframeInterface {
    func presentMusicPlayerViewFromParent(){
        presentViewFromParent()
    }
    
    func dismissMusicPlayerViewFromParent() {
        dismissViewFromParent()
    }
}


extension MusicPlayerWireframe: ViewTransitionDelegate {
    func shouldAttachToSuperview() {
    PresentationTransition.animate(view: musicPlayerView, with: parent.frame) {
            
        }
    }
    
    func shouldRemoveFromSuperview() {
        DismissalTransition.animate(view: musicPlayerView, with: parent.frame) {
            self.musicPlayerView.removeFromSuperview()
            self.musicPlayerView.transitionDelegate = nil
            self.musicPlayerView.eventHandler = nil
            self.musicPlayerView = nil
        }
    }
}
