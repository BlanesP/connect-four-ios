//
//  MainMenuPresenter.swift
//  ConnectFour
//
//  Created by Pau Blanes on 26/11/21.
//

import Foundation

protocol MainMenuPresenter {
    func succededToDownloadGameConfig()
    func failedToDownloadGameConfig(wirh error: CustomError)
}

final class DefaultMainMenuPresenter {
    
    weak var viewController: (MainMenuViewControllerInput & AlertDisplayer)?
}

extension DefaultMainMenuPresenter: MainMenuPresenter {
    
    func succededToDownloadGameConfig() {
        viewController?.goToGame()
    }
    
    func failedToDownloadGameConfig(wirh error: CustomError) {
        var title = ""
        if let errorCode = error.statusCode { title = "\(errorCode)" }
        viewController?.showAlert(title: title, message: error.description, btnText: String(localized: "OK"), btnAction: nil)
    }
}
