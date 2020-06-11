/**
 * Presenter contains view logic for preparing content for display (as received from the Interactor) and for reacting to user inputs (by requesting new data from the Interactor).
 *
 * Entities are never passed from the Interactor to the Presenter.
 * Instead, simple data structures that have no behavior are passed from the Interactor to the Presenter.
 * This prevents any ‘real work’ from being done in the Presenter.
 * The Presenter can only prepare the data for display in the View.
 */
public protocol BasePresenter: ViewAttachable {
    
    associatedtype Interactor
    associatedtype Router
    
    func configure(interactor: Interactor)
    func configure(router: Router)
    
    
}

public protocol ViewAttachable {
    associatedtype View
    func attachView(view: View)
    func detachView()
}

