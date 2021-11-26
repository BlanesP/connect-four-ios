//
//  PlayerModel.swift
//  ConnectFour
//
//  Created by Pau Blanes on 25/11/21.
//

import Foundation

enum ChipOwner: String {
    case none
    case player1
    case player2
}

struct Player {
    
    let id: String
    let name: String
    let chip: ChipOwner
    let colorHex: String
}

extension Player: Equatable {
    
    static func ==(lhs: Player, rhs: Player) -> Bool {
        return lhs.id == rhs.id
    }
}
