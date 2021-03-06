//
//  GameFactory.swift
//  ConnectFour
//
//  Created by BlanesP on 23/11/21.
//

import Foundation
import UIKit

final class GameFactory {
    
    static func createGameModule(with configuration: GameConfigurationEntity) -> GameViewController {
    
        let player1 = Player(name: configuration.name1, id: .player1, colorHex: configuration.color1)
        let player2 = Player(name: configuration.name2, id: .player2, colorHex: configuration.color2)
        let gameState = DefaultGameState(id: configuration.id,
                                  boardSize: BoardSize(numRows: 6, numColumns: 7),
                                  player1: player1, player2: player2)
        
        let presenter = DefaultGamePresenter()
        let interactor = DefaultGameInteractor(gameState: gameState, presenter: presenter)
        
        let router = DefaultGameRouter()
        
        let viewController = GameViewController.getStoryboardInstance()
        viewController.interactor = interactor
        viewController.router = router
    
        router.viewController = viewController
        presenter.viewController = viewController
        
        return viewController
    }
}
