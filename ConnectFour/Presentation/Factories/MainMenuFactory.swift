//
//  MainMenuFactory.swift
//  ConnectFour
//
//  Created by BlanesP on 26/11/21.
//

import Foundation

final class MainMenuFactory {
    
    static func createMainMenuModule() -> MainMenuViewController {
        
        let presenter = DefaultMainMenuPresenter()
        let apiRepository = DefaultApiRepository()
        let worker = DefaultGameConfigurationWorker(apiRepository: apiRepository)
        let interactor = DefaultMainMenuInteractor(presenter: presenter, worker: worker)
        let router = DefaultMainMenuRouter(dataSource: interactor)
        
        let viewController = MainMenuViewController.getStoryboardInstance()
        
        presenter.viewController = viewController
        router.viewController = viewController
        apiRepository.feedbackDisplayer = viewController
        viewController.interactor = interactor
        viewController.router = router
        
        return viewController
    }
}
