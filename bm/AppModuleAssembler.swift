import Foundation

final class AppModuleAssembler {
	private let musicPlayerPresenter = MusicPlayerPresenter()

	let musicPlayerWireframe = MusicPlayerWireframe()

    // MARK: Setup Music Player Module
    func setupMusicPlayerModule(musicPlayerDataManager: MusicPlayerDataManager) {
        let musicPlayerInterator = MusicPlayerInteractor(dataManager: musicPlayerDataManager)
        
        musicPlayerInterator.configure(output: musicPlayerPresenter)
        musicPlayerPresenter.configure(interactor: musicPlayerInterator)
        musicPlayerPresenter.configure(router: musicPlayerWireframe)
        musicPlayerWireframe.configure(presenter: musicPlayerPresenter)
    }

}
