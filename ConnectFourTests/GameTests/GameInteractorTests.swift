//
//  GameInteractorTests.swift
//  ConnectFourTests
//
//  Created by BlanesP on 27/11/21.
//

import XCTest
@testable import ConnectFour

class GameInteractorTests: XCTestCase {

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
    
    //MARK: - Data Flow Tests
    func testGameStarted() {
        
        let (interactor, presenterSpy) = createGameInteractor(with: emptyBoard)
        
        interactor.startGame()
        
        XCTAssertTrue(presenterSpy.startGameCalled)
    }
    
    func testTapValidColumn() {
        
        let (interactor, presenterSpy) = createGameInteractor(with: emptyBoard, currentPlayer: .player1)
        
        interactor.tap(at: 0)
        
        XCTAssertEqual(presenterSpy.playerMoving?.id, .player1)
        XCTAssertTrue(presenterSpy.movePosition?.row == 0 && presenterSpy.movePosition?.column == 0)
        XCTAssertEqual(presenterSpy.nextPlayer?.id, .player2)
    }
    
    func testTapFullColumn() {
        
        let (interactor, presenterSpy) = createGameInteractor(with: almostFullBoard, currentPlayer: .player1)
        
        interactor.tap(at: 0)
        
        XCTAssertNil(presenterSpy.playerMoving)
        XCTAssertNil(presenterSpy.movePosition)
        XCTAssertNil(presenterSpy.nextPlayer)
        XCTAssertTrue(presenterSpy.columnFullCalled)
    }
    
    func testFillBoard() {
        
        let (interactor, presenterSpy) = createGameInteractor(with: almostFullBoard, currentPlayer: .player1)
        
        interactor.tap(at: 6)
        
        XCTAssertEqual(presenterSpy.playerMoving?.id, .player1)
        XCTAssertTrue(presenterSpy.movePosition?.row == 5 && presenterSpy.movePosition?.column == 6)
        XCTAssertNil(presenterSpy.nextPlayer)
        XCTAssertTrue(presenterSpy.gameDrawCalled)
    }
    
    func testTapWinningMove() {
        
        let (interactor, presenterSpy) = createGameInteractor(with: board4, currentPlayer: .player2)
        
        interactor.tap(at: 2)
        
        XCTAssertEqual(presenterSpy.playerMoving?.id, .player2)
        XCTAssertTrue(presenterSpy.movePosition?.row == 5 && presenterSpy.movePosition?.column == 2)
        XCTAssertNil(presenterSpy.nextPlayer)
        XCTAssertEqual(presenterSpy.winner?.id, .player2)
    }
    
    //MARK: - Game Logic Tests
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
        let gameState = createGameState(with: boardString, player1: player1, player2: player2)
        return DefaultGameInteractor(gameState: gameState, presenter: presenter)
    }
    
    func createGameState(with boardString: String,
                         player1: Player = Player(name: "", id: .player1, colorHex: ""),
                         player2: Player = Player(name: "", id: .player2, colorHex: "")) -> GameState {
        
        return MockGameState(boardString: boardString, boardSize: BoardSize(numRows: 6, numColumns: 7), player1: player1, player2: player2)
    }
    
    func createGameInteractor(with boardString: String,
                              player1: Player = Player(name: "", id: .player1, colorHex: ""),
                              player2: Player = Player(name: "", id: .player2, colorHex: ""),
                              currentPlayer: PlayerId = .player1) -> (GameInteractor, GamePresenterSpy) {
        
        let presenterSpy = GamePresenterSpy()
        var gameState = createGameState(with: boardString, player1: player1, player2: player2)
        gameState.currentPlayer = (currentPlayer == .player1) ? gameState.player1 : gameState.player2
        let interactor = DefaultGameInteractor(gameState: gameState, presenter: presenterSpy)
        
        return (interactor, presenterSpy)
    }
}
