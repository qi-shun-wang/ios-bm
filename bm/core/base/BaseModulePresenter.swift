public protocol BaseModulePresenter: BasePresenter {
    associatedtype ModuleDelegate
    
    func configure(moduleDelegate: ModuleDelegate)
}