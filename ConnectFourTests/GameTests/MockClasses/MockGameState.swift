//
//  MockGameState.swift
//  ConnectFourTests
//
//  Created by Pau Blanes on 27/11/21.
//

import Foundation
@testable import ConnectFour

class MockGameState: GameState {
    
    let id: UInt64
    let boardSize: BoardSize
    let player1: Player
    let player2: Player
    
    var board: Grid<PlayerId>
    var currentPlayer: Player
    
    init(boardString: String, boardSize: BoardSize, player1: Player, player2: Player) {
        
        var boardFromString = Grid<PlayerId>()
        let boardRows = boardString.split(separator: "\n").filter({!$0.isEmpty})
        for (rowIndex, rowString) in boardRows.reversed().enumerated() {
            
            let rowItems: [PlayerId] = rowString.split(separator: "|").map({
                if $0 == "1" {return .player1}
                if $0 == "2" {return .player2}
                return .none
            })
            
            for (columnIndex,chip) in rowItems.enumerated() {
                
                if rowIndex == 0 {
                    boardFromString.addNewColumn(with: [chip])
                } else {
                    boardFromString.addNewColumnItem(chip, at: columnIndex)
                }
                
            }
        }
        
        self.board = boardFromString
        self.id = 0
        self.boardSize = boardSize
        self.player1 = player1
        self.player2 = player2
        self.currentPlayer = player1
    }
}
