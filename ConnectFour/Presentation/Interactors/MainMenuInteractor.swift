//
//  MainMenuInteractor.swift
//  ConnectFour
//
//  Created by BlanesP on 26/11/21.
//

import Foundation

protocol MainMenuInteractor {
    func play()
}

protocol GameDataSource {
    var gameConfiguration: GameConfigurationEntity! { get }
}

final class DefaultMainMenuInteractor: GameDataSource {
    
    let presenter: MainMenuPresenter
    let worker: GameConfigurationWorker
    
    var gameConfiguration: GameConfigurationEntity!
    
    init(presenter: MainMenuPresenter, worker: GameConfigurationWorker) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension DefaultMainMenuInteractor: MainMenuInteractor {
    
    func play() {
        
        worker.fetchGameConfiguration { [weak self] gameConfiguration in
            
            guard let self = self else { return }
            self.gameConfiguration = gameConfiguration
            self.presenter.succededToDownloadGameConfig()
            
        } failure: { [weak self] error in
            
            guard let self = self else { return }
            self.presenter.failedToDownloadGameConfig(with: error)
        }
    }
}
