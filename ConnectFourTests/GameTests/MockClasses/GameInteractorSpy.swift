//
//  GameInteractorSpy.swift
//  ConnectFourTests
//
//  Created by BlanesP on 27/11/21.
//

import Foundation
@testable import ConnectFour

class GameInteractorSpy: GameInteractor {
    
    var didCallLoadGame = false
    
    func startGame() {
        didCallLoadGame = true
    }
    
    func tap(at column: Int) { }
}
