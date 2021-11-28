//
//  GamePresenterSpy.swift
//  ConnectFourTests
//
//  Created by BlanesP on 27/11/21.
//

import Foundation
@testable import ConnectFour

class GamePresenterSpy: GamePresenter {
    
    var startGameCalled = false
    var playerMoving: Player?
    var movePosition: BoardPosition?
    var nextPlayer: Player?
    var columnFullCalled = true
    var gameDrawCalled = true
    var winner: Player?
    
    func startGame(with boardSize: BoardSize, startingPlayer: Player) {
        startGameCalled = true
    }
    
    func player(_ player: Player, placedChipAt slot: BoardPosition) {
        playerMoving = player
        movePosition = slot
    }
    
    func turnChanged(newPlayer: Player) {
        nextPlayer = newPlayer
    }
    
    func columnIsFull() {
        columnFullCalled = true
    }
    
    func gameEndedInDraw() {
        gameDrawCalled = true
    }
    
    func gameWon(by player: Player) {
        winner = player
    }
}
