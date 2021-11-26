//
//  MainMenuPresenter.swift
//  ConnectFour
//
//  Created by Pau Blanes on 26/11/21.
//

import Foundation

protocol MainMenuPresenter {
    func succededToDownloadGameConfig()
    func failedToDownloadGameConfig()
}

final class DefaultMainMenuPresenter {
    
    weak var viewController: MainMenuViewControllerInput?
}

extension DefaultMainMenuPresenter: MainMenuPresenter {
    
    func succededToDownloadGameConfig() {
        viewController?.goToGame()
    }
    
    func failedToDownloadGameConfig() {
        //TODO: Show alert
    }
}
