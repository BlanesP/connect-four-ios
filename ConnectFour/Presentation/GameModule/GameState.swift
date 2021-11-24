//
//  GameState.swift
//  ConnectFour
//
//  Created by Pau Blanes on 23/11/21.
//

import Foundation

enum SlotState {
    case empty
    case takenByPlayer1
    case takenByPlayer2
}

struct GridSize {
    let numRows: Int
    let numColumns: Int
}

struct GameState {
    
    var slots: [[SlotState]] = []
    let gridSize: GridSize
    
    init(gridSize: GridSize) {
        
        self.gridSize = gridSize
        slots = Array(repeating: Array(repeating: .empty, count: gridSize.numRows), count: gridSize.numColumns)
    }
}
