//
//  GameInteractor.swift
//  ConnectFour
//
//  Created by Pau Blanes on 23/11/21.
//

import Foundation

protocol GameViewControllerOutput {
    func startGame()
    func tap(at column: Int)
}

struct Slot{
    let row: Int
    let column: Int
}

final class DefaultGameInteractor {
    
    weak var viewController: GameViewControllerInput?
    var gameState: GameState
    
    init(gameState: GameState) {
        self.gameState = gameState
    }
    
    func availableRow(in column: Int) -> Int? {
        return gameState.slots[column].firstIndex(where: {$0 == .empty})
    }
}

extension DefaultGameInteractor: GameViewControllerOutput {
    
    func startGame() {
        viewController?.setUpBoardView(gridSize: gameState.gridSize)
    }
    
    func tap(at column: Int) {
        
        if let availableRow = availableRow(in: column) {
            gameState.slots[column][availableRow] = .takenByPlayer1
            viewController?.placeChip(at: Slot(row: availableRow, column: column))
        } else {
            //TODO: Alert
        }
    }
}
