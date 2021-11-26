//
//  MainMenuInteractor.swift
//  ConnectFour
//
//  Created by Pau Blanes on 26/11/21.
//

import Foundation

protocol MainMenuInteractor {
    func play()
}

final class DefaultMainMenuInteractor {
    
    let presenter: MainMenuPresenter
    
    init(presenter: MainMenuPresenter) {
        self.presenter = presenter
    }
}

extension DefaultMainMenuInteractor: MainMenuInteractor {
    
    func play() {
        //TODO: Call worker to get configuration
        presenter.succededToDownloadGameConfig()
    }
}
