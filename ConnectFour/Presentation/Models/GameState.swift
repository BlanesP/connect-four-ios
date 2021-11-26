//
//  GameState.swift
//  ConnectFour
//
//  Created by Pau Blanes on 23/11/21.
//

import Foundation

struct GameState {
    
    let id: UInt64
    let boardSize: BoardSize
    let player1: Player
    let player2: Player
    var board: Grid<ChipOwner>
    var currentPlayer: Player
    
    init(id: UInt64, boardSize: BoardSize, player1: Player, player2: Player) {
        
        self.id = id
        self.boardSize = boardSize
        self.player1 = player1
        self.player2 = player2
        self.board = Grid(with: Array(repeating: Array(repeating: .none,
                                                       count: boardSize.numRows),
                                      count: boardSize.numColumns))
        self.currentPlayer = player1
    }
    
    init(id: UInt64, boardString: String, boardSize: BoardSize, player1: Player, player2: Player) {
        
        self.init(id: id, boardSize: boardSize, player1: player1, player2: player2)
        
        var boardFromString = Grid<ChipOwner>()
        let boardRows = boardString.split(separator: "\n").filter({!$0.isEmpty})
        for (rowIndex, rowString) in boardRows.enumerated() {
            
            let rowItems: [ChipOwner] = rowString.split(separator: "|").map({
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
