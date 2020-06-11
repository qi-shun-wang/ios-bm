import Foundation

class MusicPlayerPresenter {
    
    private var moduleDelegate: ModuleDelegate?
    private var view: View?
    private var interactor: Interactor?
    private var router: Router?

}

extension MusicPlayerPresenter: BaseModulePresenter {
    
    typealias ModuleDelegate = MusicPlayerModuleDelegate
    typealias View = MusicPlayerViewInterface
    typealias Interactor = MusicPlayerInteractorInput
    typealias Router = MusicPlayerWireframeInterface
    
    func configure(interactor: Interactor) {
        self.interactor = interactor
    }
    
    func configure(router: Router) {
        self.router = router
    }
    
    func configure(moduleDelegate: ModuleDelegate) {
        self.moduleDelegate = moduleDelegate
    }
}

extension MusicPlayerPresenter: MusicPlayerPresenterInterface {
    func attachView(view: MusicPlayerViewInterface) {
        self.view = view
        self.view?.present()
    }
    
    func detachView() {
        view?.dismiss()
        view = nil

    }
}


extension MusicPlayerPresenter: MusicPlayerModuleInterface {
   
   
}

extension MusicPlayerPresenter: MusicPlayerInteractorOutput {
     
}

