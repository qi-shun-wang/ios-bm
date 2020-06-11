class MusicPlayerInteractor: BaseInteractor {
    
    typealias Output = MusicPlayerInteractorOutput
    
    private var output: MusicPlayerInteractorOutput?
    
    private var musicPlayerDataManager: MusicPlayerDataManager
    
    init(dataManager: MusicPlayerDataManager) {
        musicPlayerDataManager = dataManager
    }
}

extension MusicPlayerInteractor: MusicPlayerInteractorInput {
    
    func configure(output: MusicPlayerInteractorOutput) {
        self.output = output
    }
    
}
