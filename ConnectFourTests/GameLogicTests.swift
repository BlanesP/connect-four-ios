//
//  GmeLogicTests.swift
//  ConnectFourTests
//
//  Created by Pau Blanes on 27/11/21.
//

import XCTest
@testable import ConnectFour

class GameLogicTests: XCTestCase {

    //MARK: - Boards
    var emptyBoard:String {
        return """
                            X|X|X|X|X|X|X
                            X|X|X|X|X|X|X
                            X|X|X|X|X|X|X
                            X|X|X|X|X|X|X
                            X|X|X|X|X|X|X
                            X|X|X|X|X|X|X
                            """
    }
    
    var almostFullBoard:String {
        return """
                            1|1|2|1|1|2|X
                            1|2|2|2|1|1|1
                            2|1|2|1|1|2|2
                            2|1|1|1|1|1|1
                            1|1|1|1|2|2|1
                            1|1|2|1|2|1|1
                            """
    }
    
    var fullBoard:String {
        return """
                            1|1|2|1|1|2|2
                            1|2|2|2|1|1|1
                            2|1|2|1|1|2|2
                            2|1|1|1|1|1|1
                            1|1|1|1|2|2|1
                            1|1|2|1|2|1|1
                            """
    }
    
    var board1:String {
        return """
                            1|X|X|X|X|X|X
                            1|X|X|X|X|X|1
                            1|X|X|X|X|X|1
                            1|X|X|X|X|X|1
                            1|X|X|X|X|X|1
                            1|1|X|X|X|X|1
                            """
    }
    
    var board2:String {
        return """
                            1|X|X|X|X|X|X
                            1|X|X|X|X|X|1
                            2|X|X|X|X|X|2
                            2|X|X|X|X|X|1
                            1|X|X|X|X|X|1
                            1|1|X|X|X|X|1
                            """
    }
    
    var board3:String {
        return """
                            X|X|X|X|X|X|X
                            X|X|X|X|X|X|X
                            X|X|X|2|X|X|X
                            X|X|1|1|X|1|X
                            X|X|1|2|X|2|X
                            X|1|2|1|X|2|X
                            """
    }
    
    var board4:String {
        return """
                            X|X|X|X|X|X|X
                            X|X|1|2|X|X|X
                            X|X|2|2|2|1|X
                            X|X|1|1|2|2|X
                            X|X|1|2|1|2|X
                            X|2|1|1|1|2|1
                            """
    }
    
    var board5:String {
        return """
                            X|X|2|X|X|X|X
                            X|X|1|2|X|X|X
                            X|X|2|2|2|1|X
                            X|X|1|1|2|2|X
                            X|X|1|2|1|2|X
                            X|2|1|1|1|2|1
                            """
    }
    
    var board6:String {
        return """
                            X|X|X|X|X|X|X
                            X|X|X|X|X|X|X
                            X|X|X|X|1|X|X
                            X|2|2|1|1|X|X
                            X|2|1|2|2|X|1
                            2|1|1|1|2|X|2
                            """
    }
    
    var board7:String {
        return """
                            2|X|2|1|X|2|1
                            1|X|1|2|X|1|2
                            2|X|1|1|1|1|1
                            2|X|1|1|2|2|2
                            2|X|2|2|1|2|1
                            1|X|1|2|2|2|1
                            """
    }
    
    var board8:String {
        return """
                            X|X|X|X|X|X|X
                            X|X|X|X|X|X|X
                            X|X|2|1|X|X|X
                            X|1|2|2|X|X|X
                            1|1|1|2|2|X|X
                            2|2|1|1|1|2|2
                            """
    }
    
    var board9:String {
        return """
                            X|X|X|X|X|X|X
                            X|X|X|X|X|X|X
                            X|X|X|X|X|1|X
                            X|X|X|X|1|2|X
                            X|1|X|1|2|2|X
                            X|2|1|2|2|1|X
                            """
    }
    
    var board10:String {
        return """
                            1|2|2|1|2|X|2
                            2|2|1|2|1|X|1
                            1|1|2|1|1|X|2
                            2|1|2|2|2|2|1
                            1|2|2|1|1|1|2
                            1|2|1|2|1|2|1
                            """
    }
    
    //MARK: - Tests
    func testChangingPlayer() {
        
        let gameLogic = createGameLogic(with: emptyBoard)
        let firstPlayer = gameLogic.gameState.currentPlayer
        
        gameLogic.selectNextPlayer()
        XCTAssertNotEqual(gameLogic.gameState.currentPlayer.id, firstPlayer.id)
        
        gameLogic.selectNextPlayer()
        XCTAssertEqual(gameLogic.gameState.currentPlayer.id, firstPlayer.id)
    }
    
    func testStartingPlayer() {
        
        let gameLogic = createGameLogic(with: emptyBoard)
        gameLogic.selectStartingPlayer()
        let selectedPlayerId = gameLogic.gameState.currentPlayer.id
        
        XCTAssertTrue(selectedPlayerId == gameLogic.gameState.player1.id || selectedPlayerId == gameLogic.gameState.player2.id)
    }
    
    func testAvailableRow() {
        
        var gameLogic = createGameLogic(with: emptyBoard)
        XCTAssertNotNil(gameLogic.availableRow(in: 0))
        XCTAssertNil(gameLogic.availableRow(in: 50))
        
        gameLogic = createGameLogic(with: board1)
        XCTAssertNil(gameLogic.availableRow(in: 0))
        XCTAssertNotNil(gameLogic.availableRow(in: 1))
        XCTAssertNotNil(gameLogic.availableRow(in: 6))
        
        gameLogic = createGameLogic(with: board2)
        XCTAssertNil(gameLogic.availableRow(in: 0))
        XCTAssertNotNil(gameLogic.availableRow(in: 1))
        XCTAssertNotNil(gameLogic.availableRow(in: 6))
    }
    
    func testBoardIsFull() {
        
        var gameLogic = createGameLogic(with: emptyBoard)
        XCTAssertFalse(gameLogic.isBoardFull())
        
        gameLogic = createGameLogic(with: board1)
        XCTAssertFalse(gameLogic.isBoardFull())
        
        gameLogic = createGameLogic(with: almostFullBoard)
        XCTAssertFalse(gameLogic.isBoardFull())
        
        gameLogic = createGameLogic(with: fullBoard)
        XCTAssertTrue(gameLogic.isBoardFull())
    }
    
    func testResetEmptyBoard() {
        
        let gameLogic = createGameLogic(with: emptyBoard)
        gameLogic.resetBoard()
        
        for i in 0..<gameLogic.gameState.boardSize.numColumns {
            for j in 0..<gameLogic.gameState.boardSize.numRows {
                XCTAssertEqual(gameLogic.gameState.board.getValue(for: BoardPosition(row: j, column: i)), PlayerId.none)
            }
        }
    }
    
    func testResetFullBoard() {
        
        let gameLogic = createGameLogic(with: fullBoard)
        gameLogic.resetBoard()
        
        for i in 0..<gameLogic.gameState.boardSize.numColumns {
            for j in 0..<gameLogic.gameState.boardSize.numRows {
                XCTAssertEqual(gameLogic.gameState.board.getValue(for: BoardPosition(row: j, column: i)), PlayerId.none)
            }
        }
    }
    
    func testGameIsWon() {
        
        var gameLogic = createGameLogic(with: board3)
        XCTAssertFalse(gameLogic.gameIsWon(by: gameLogic.gameState.player1, lastMoveAt: BoardPosition(row: 2, column: 2)))
        
        gameLogic = createGameLogic(with: board4)
        XCTAssertFalse(gameLogic.gameIsWon(by: gameLogic.gameState.player2, lastMoveAt: BoardPosition(row: 4, column: 3)))
        
        gameLogic = createGameLogic(with: board5)
        XCTAssertTrue(gameLogic.gameIsWon(by: gameLogic.gameState.player2, lastMoveAt: BoardPosition(row: 5, column: 2)))
        
        gameLogic = createGameLogic(with: board6)
        XCTAssertTrue(gameLogic.gameIsWon(by: gameLogic.gameState.player1, lastMoveAt: BoardPosition(row: 3, column: 4)))
        
        gameLogic = createGameLogic(with: board7)
        XCTAssertTrue(gameLogic.gameIsWon(by: gameLogic.gameState.player1, lastMoveAt: BoardPosition(row: 3, column: 4)))
        
        gameLogic = createGameLogic(with: board8)
        XCTAssertTrue(gameLogic.gameIsWon(by: gameLogic.gameState.player2, lastMoveAt: BoardPosition(row: 3, column: 2)))
        
        gameLogic = createGameLogic(with: board9)
        XCTAssertTrue(gameLogic.gameIsWon(by: gameLogic.gameState.player1, lastMoveAt: BoardPosition(row: 3, column: 5)))
        
        gameLogic = createGameLogic(with: board10)
        XCTAssertTrue(gameLogic.gameIsWon(by: gameLogic.gameState.player2, lastMoveAt: BoardPosition(row: 2, column: 5)))
    }
    
    func testWeirdCaseGameIsWon() {
        
        let gameLogic = createGameLogic(with: fullBoard)
        XCTAssertTrue(gameLogic.gameIsWon(by: gameLogic.gameState.player1, lastMoveAt: BoardPosition(row: 2, column: 1)))
        XCTAssertFalse(gameLogic.gameIsWon(by: gameLogic.gameState.player1, lastMoveAt: BoardPosition(row: 5, column: 0)))//Wining condition is checked from your lastMovement
        XCTAssertTrue(gameLogic.gameIsWon(by: gameLogic.gameState.player1, lastMoveAt: BoardPosition(row: 3, column: 1)))
        XCTAssertFalse(gameLogic.gameIsWon(by: gameLogic.gameState.player2, lastMoveAt: BoardPosition(row: 4, column: 1)))
    }
    
    //MARK: - Utils
    func createGameLogic(with boardString: String,
                         player1: Player = Player(name: "", id: .player1, colorHex: ""),
                         player2: Player = Player(name: "", id: .player2, colorHex: "")) -> GameLogic {
        
        let presenter = DefaultGamePresenter()
        let gameState = GameState(id: 0, boardString: boardString, boardSize: BoardSize(numRows: 6, numColumns: 7), player1: player1, player2: player2)
        return DefaultGameInteractor(gameState: gameState, presenter: presenter)
    }
}
