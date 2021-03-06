//
//  MainMenuPresenter.swift
//  ConnectFour
//
//  Created by BlanesP on 26/11/21.
//

import Foundation

protocol MainMenuPresenter {
    func succededToDownloadGameConfig()
    func failedToDownloadGameConfig(with error: CustomError)
}

final class DefaultMainMenuPresenter {
    
    weak var viewController: (MainMenuViewControllerInput & AlertDisplayer)?
}

extension DefaultMainMenuPresenter: MainMenuPresenter {
    
    func succededToDownloadGameConfig() {
        viewController?.goToGame()
    }
    
    func failedToDownloadGameConfig(with error: CustomError) {
        var title = ""
        if let errorCode = error.statusCode { title = "\(errorCode)" }
        viewController?.showAlert(title: title, message: error.description, btnText: String(localized: "OK"), btnAction: nil)
    }
}
