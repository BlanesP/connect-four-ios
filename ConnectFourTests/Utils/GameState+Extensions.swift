//
//  Board+Extensions.swift
//  ConnectFourTests
//
//  Created by Pau Blanes on 27/11/21.
//

import Foundation
@testable import ConnectFour

extension GameState {
    
    init(id: UInt64, boardString: String, boardSize: BoardSize, player1: Player, player2: Player) {
        
        self.init(id: id, boardSize: boardSize, player1: player1, player2: player2)
        
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
    }
}
