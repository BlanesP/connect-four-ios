//
//  Player.swift
//  ConnectFour
//
//  Created by Pau Blanes on 25/11/21.
//

import Foundation

enum PlayerId: String {
    case none
    case player1
    case player2
}

struct Player {
    
    let name: String
    let id: PlayerId
    let colorHex: String
}

extension Player: Equatable {
    
    static func ==(lhs: Player, rhs: Player) -> Bool {
        return lhs.id == rhs.id
    }
}
