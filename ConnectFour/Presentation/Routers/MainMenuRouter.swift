//
//  MainMenuRouter.swift
//  ConnectFour
//
//  Created by Pau Blanes on 26/11/21.
//

import Foundation
import UIKit

protocol MainMenuRouter {
    func goToGame()
}

final class DefaultMainMenuRouter {
    
    weak var viewController: UIViewController?
    var dataSource: GameDataSource
    
    init(dataSource: GameDataSource) {
        self.dataSource = dataSource
    }
}

extension DefaultMainMenuRouter: MainMenuRouter {
    
    func goToGame() {
        
        let vc = GameFactory.createGameModule(with: dataSource.gameConfiguration)
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .fullScreen
        viewController?.present(nc, animated: true, completion: nil)
    }
}
