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
    
    var board: Grid<PlayerId>
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
}
