//
//  GamePresenterTests.swift
//  ConnectFourTests
//
//  Created by Pau Blanes on 27/11/21.
//

import XCTest
@testable import ConnectFour

class GamePresenterTests: XCTestCase {
    
    func testSetupBoard() {
        
        let (presenter, presenterSpy) = createGamePresenter()
        let inputBoardSize = createBoardSize()
        let inputPlayer = createPlayer()
        
        presenter.startGame(with: inputBoardSize, startingPlayer: inputPlayer)
        
        XCTAssertTrue(presenterSpy.didSetupBoard)
        XCTAssertTrue(presenterSpy.didSetTitle)
        XCTAssertEqual(presenterSpy.boardSize?.numRows, inputBoardSize.numRows)
        XCTAssertEqual(presenterSpy.boardSize?.numColumns, inputBoardSize.numColumns)
        XCTAssertTrue(presenterSpy.titleMessage?.contains(inputPlayer.name) ?? false)
    }
    
    func testPlayerMove() {
        
        let (presenter, presenterSpy) = createGamePresenter()
        let inputPlayer = createPlayer()
        let inputSlot = BoardPosition(row: 2, column: 3)
        
        presenter.player(inputPlayer, placedChipAt: inputSlot)
        
        XCTAssertTrue(presenterSpy.didDrawChip)
        XCTAssertEqual(presenterSpy.chipViewModel?.color, UIColor(hexString: inputPlayer.colorHex))
    }
    
    func testChangePlayer() {
        
        let (presenter, presenterSpy) = createGamePresenter()
        let inputPlayer = createPlayer()
        
        presenter.turnChanged(newPlayer: inputPlayer)
        
        XCTAssertTrue(presenterSpy.didSetTitle)
        XCTAssertTrue(presenterSpy.titleMessage?.contains(inputPlayer.name) ?? false)
    }
    
    func testColumnFull() {
        
        let (presenter, presenterSpy) = createGamePresenter()
        
        presenter.columnIsFull()
        
        XCTAssertTrue(presenterSpy.didShowAlert)
    }
    
    func testGameDraw() {
        
        let (presenter, presenterSpy) = createGamePresenter()
        
        presenter.gameEndedInDraw()
        
        XCTAssertTrue(presenterSpy.didShowAlert)
    }
    
    func testGameWin() {
        
        let (presenter, presenterSpy) = createGamePresenter()
        let inputPlayer = createPlayer()
        
        presenter.gameWon(by: inputPlayer)
        
        XCTAssertTrue(presenterSpy.didShowAlert)
        XCTAssertTrue(presenterSpy.alertMessage?.contains(inputPlayer.name) ?? false)
    }
    
    //MARK: Utils
    func createGamePresenter() -> (GamePresenter, GameViewControllerInputSpy) {
        
        let presenter = DefaultGamePresenter()
        let presenterSpy = GameViewControllerInputSpy()
        presenter.viewController = presenterSpy
        
        return (presenter, presenterSpy)
    }
    
    func createBoardSize() -> BoardSize {
        return BoardSize(numRows: 6, numColumns: 7)
    }
    
    func createPlayer() -> Player {
        return Player(name: "TestName", id: .player1, colorHex: "#ff0000")
    }
}

