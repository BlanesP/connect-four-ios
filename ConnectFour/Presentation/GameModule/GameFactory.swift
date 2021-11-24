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
        
        let gameState = GameState(gridSize: GridSize(numRows: 6, numColumns: 7))
        let interactor = DefaultGameInteractor(gameState: gameState)
        
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewControllerId") as! GameViewController
        viewController.interactor = interactor
        
        interactor.viewController = viewController
        
        return viewController
    }
}
