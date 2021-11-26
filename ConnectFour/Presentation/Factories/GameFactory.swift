//
//  GameFactory.swift
//  ConnectFour
//
//  Created by Pau Blanes on 23/11/21.
//

import Foundation
import UIKit

final class GameFactory {
    
    static func createGameModule() -> GameViewController {
    
        let gameState = GameState(boardSize: BoardSize(numRows: 6, numColumns: 7),
                                  player1: Player(id: "a", name: "1", chip: .player1, colorHex: "#FF0000"),
                                  player2: Player(id: "b", name: "2", chip: .player2, colorHex: "#0000FF"))
        
        let presenter = DefaultGamePresenter()
        let interactor = DefaultGameInteractor(gameState: gameState, presenter: presenter)
        
        let viewController = GameViewController.getStoryboardInstance()
        viewController.interactor = interactor
    
        presenter.viewController = viewController
        
        return viewController
    }
}
