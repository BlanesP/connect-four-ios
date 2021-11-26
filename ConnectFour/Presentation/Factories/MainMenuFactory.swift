//
//  MainMenuFactory.swift
//  ConnectFour
//
//  Created by Pau Blanes on 26/11/21.
//

import Foundation

final class MainMenuFactory {
    
    static func createMainMenuModule() -> MainMenuViewController {
        
        let presenter = DefaultMainMenuPresenter()
        let interactor = DefaultMainMenuInteractor(presenter: presenter)
        let router = DefaultMainMenuRouter()
        
        let viewController = MainMenuViewController.getStoryboardInstance()
        
        presenter.viewController = viewController
        router.viewController = viewController
        viewController.interactor = interactor
        viewController.router = router
        
        return viewController
    }
}
