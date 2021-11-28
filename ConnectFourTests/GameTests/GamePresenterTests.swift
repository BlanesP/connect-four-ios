//
//  GamePresenterTests.swift
//  ConnectFourTests
//
//  Created by Pau Blanes on 27/11/21.
//

import XCTest
@testable import ConnectFour

class GamePresenterTests: XCTestCase {
    
    var boardSize: BoardSize!
    var player: Player!
    var presenter: GamePresenter!
    var viewControllerInputSpy: GameViewControllerInputSpy!
    
    override func setUpWithError() throws {
        
        boardSize = BoardSize(numRows: 6, numColumns: 7)
        player = Player(name: "TestName", id: .player1, colorHex: "#ff0000")
        let defaultPresenter = DefaultGamePresenter()
        viewControllerInputSpy = GameViewControllerInputSpy()
        defaultPresenter.viewController = viewControllerInputSpy
        presenter = defaultPresenter
    }
    
    func testSetupBoard() {
        
        presenter.startGame(with: boardSize, startingPlayer: player)
        
        XCTAssertTrue(viewControllerInputSpy.didSetupBoard)
        XCTAssertEqual(viewControllerInputSpy.boardSize?.numRows, boardSize.numRows)
        XCTAssertEqual(viewControllerInputSpy.boardSize?.numColumns, boardSize.numColumns)
        XCTAssertTrue(viewControllerInputSpy.titleMessage?.contains(player.name) ?? false)
    }
    
    func testPlayerMove() {
        
        let inputSlot = BoardPosition(row: 2, column: 3)
        
        presenter.player(player, placedChipAt: inputSlot)
        
        XCTAssertTrue(viewControllerInputSpy.didDrawChip)
        XCTAssertEqual(viewControllerInputSpy.chipViewModel?.color, UIColor(hexString: player.colorHex))
    }
    
    func testChangePlayer() {
        
        presenter.turnChanged(newPlayer: player)
        
        XCTAssertTrue(viewControllerInputSpy.titleMessage?.contains(player.name) ?? false)
    }
    
    func testColumnFull() {
        
        presenter.columnIsFull()
        
        XCTAssertTrue(viewControllerInputSpy.didShowAlert)
    }
    
    func testGameDraw() {
        
        presenter.gameEndedInDraw()
        
        XCTAssertTrue(viewControllerInputSpy.didShowAlert)
    }
    
    func testGameWin() {
        
        presenter.gameWon(by: player)
        
        XCTAssertTrue(viewControllerInputSpy.didShowAlert)
        XCTAssertTrue(viewControllerInputSpy.alertMessage?.contains(player.name) ?? false)
    }
}

