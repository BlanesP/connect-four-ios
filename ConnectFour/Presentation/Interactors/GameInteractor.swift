//
//  GameInteractor.swift
//  ConnectFour
//
//  Created by Pau Blanes on 23/11/21.
//

import Foundation

protocol GameInteractor {
    func startGame()
    func tap(at column: Int)
}

enum Direction: Int {
    case none = 0
    case positive = 1
    case negative = -1
}

final class DefaultGameInteractor {
    
    let matchesToWin = 3
    let presenter: GamePresenter
    var gameState: GameState
    
    //MARK: GameStateUtils
    var boardSize: BoardSize { return gameState.boardSize }
    
    //MARK: Inits
    init(gameState: GameState, presenter: GamePresenter) {
        self.presenter = presenter
        self.gameState = gameState
    }
    
    //MARK: Winning conditions
    func isBoardFull() -> Bool {
        
        for columnIndex in 0..<boardSize.numColumns {
            if availableRow(in: columnIndex) != nil {
                return false
            }
        }
        return true
    }
    
    func gameIsWon(at slot: BoardPosition) -> Bool {
        
        let player = gameState.currentPlayer
        
        //Horizontal win
        if matchesFor(player.chip,startingBoardPosition: slot,direction: (x: .positive, y: .none)) +
            matchesFor(player.chip, startingBoardPosition: slot, direction: (x: .negative, y: .none)) == matchesToWin {
            return true
        }
        
        //Vertical win
        if matchesFor(player.chip,startingBoardPosition: slot,direction: (x: .none, y: .positive)) +
            matchesFor(player.chip, startingBoardPosition: slot, direction: (x: .none, y: .negative)) == matchesToWin {
            return true
        }
        
        //Diagonal Win
        if matchesFor(player.chip,startingBoardPosition: slot,direction: (x: .positive, y: .positive)) +
            matchesFor(player.chip, startingBoardPosition: slot, direction: (x: .positive, y: .negative)) == matchesToWin {
            return true
        }
        if matchesFor(player.chip,startingBoardPosition: slot,direction: (x: .negative, y: .positive)) +
            matchesFor(player.chip, startingBoardPosition: slot, direction: (x: .negative, y: .negative)) == matchesToWin {
            return true
        }
        
        return false
    }
    
    func matchesFor(_ chip: ChipOwner, startingBoardPosition: BoardPosition, direction: (x: Direction, y: Direction)) -> Int {
        
        var matches = 0
        
        for i in 1...matchesToWin {
            
            let xOffset = i * direction.x.rawValue
            let yOffset = i * direction.y.rawValue
            let targetRow = startingBoardPosition.row + yOffset
            let targetColumn = startingBoardPosition.column + xOffset
            
            if targetRow < 0 || targetRow >= boardSize.numRows { return matches }
            if targetColumn < 0 || targetColumn >= boardSize.numColumns { return matches }
            
            if let targetBoardPosition = gameState.board.getValue(for: BoardPosition(row: targetRow, column: targetColumn)), targetBoardPosition == chip {
                matches += 1
            } else {
                return matches
            }
        }
        
        return matches
    }
    
    //MARK: Board Utils
    func availableRow(in columnIndex: Int) -> Int? {
        return gameState.board.getColumn(at: columnIndex)?.firstIndex(where: {$0 == .none})
    }
    
    func resetBoard() {
        gameState.board = Grid(with: Array(repeating: Array(repeating: .none,
                                                            count: boardSize.numRows),
                                           count: boardSize.numColumns))
    }
    
    //MARK: Player utils
    func selectStartingPlayer() {
        gameState.currentPlayer = Bool.random() ? gameState.player1 : gameState.player2
    }
    
    func selectNextPlayer() {
        
        if gameState.currentPlayer == gameState.player1 {
            gameState.currentPlayer = gameState.player2
        } else {
            gameState.currentPlayer = gameState.player1
        }
    }
}

extension DefaultGameInteractor: GameInteractor {
    
    func startGame() {
        selectStartingPlayer()
        resetBoard()
        presenter.startGame(with: boardSize)
    }
    
    func tap(at column: Int) {
        
        if let availableRow = availableRow(in: column) {
            
            let targetBoardPosition = BoardPosition(row: availableRow, column: column)
            let currentPlayer = gameState.currentPlayer
            gameState.board.setValue(currentPlayer.chip, for: targetBoardPosition)
            presenter.player(currentPlayer, placedChipAt: targetBoardPosition)
            
            if isBoardFull() {
                presenter.gameEndedInDraw()
            } else if gameIsWon(at: targetBoardPosition) {
                presenter.gameWon(by: currentPlayer)
            } else {
                selectNextPlayer()
            }
            
        } else {
            presenter.columnIsFull()
        }
    }
}
