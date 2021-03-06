//
//  GamePresenter.swift
//  ConnectFour
//
//  Created by BlanesP on 25/11/21.
//

import Foundation
import UIKit

protocol GamePresenter {
    func startGame(with boardSize: BoardSize, startingPlayer: Player)
    func player(_ player: Player, placedChipAt slot: BoardPosition)
    func turnChanged(newPlayer: Player)
    func columnIsFull()
    func gameEndedInDraw()
    func gameWon(by player: Player)
}

final class DefaultGamePresenter {
    
    weak var viewController: (GameViewControllerInput & AlertDisplayer)?
}

extension DefaultGamePresenter: GamePresenter {
    
    func startGame(with boardSize: BoardSize, startingPlayer: Player) {
        //Here you could add animations, labels, anything that the view needs to visually display at the start of the game
        viewController?.setUpBoardView(boardSize: boardSize)
        viewController?.setTitle(with: String(format: String(localized: "PlayerTurn"), startingPlayer.name))
    }
    
    func player(_ player: Player, placedChipAt slot: BoardPosition) {
        viewController?.draw(chip: ChipViewModel(color: UIColor(hexString: player.colorHex, alpha: 1)), at: slot)
    }
    
    func turnChanged(newPlayer: Player) {
        viewController?.setTitle(with: String(format: String(localized: "PlayerTurn"), newPlayer.name))
    }
    
    func columnIsFull() {
        viewController?.showAlert(title: String(localized: "Attention"), message: String(localized: "ColumnFull"), btnText: String(localized: "OK"), btnAction: nil)
    }
    
    func gameEndedInDraw() {
        
        viewController?.showResultView(with: ResultViewModel(titleText: String(localized: "ItsDraw").uppercased(), buttonText: String(localized: "GoToMenu").uppercased()))
    }
    
    func gameWon(by player: Player) {
        
        viewController?.showResultView(with: ResultViewModel(titleText: String(format: String(localized: "PlayerWins"), player.name).uppercased(), buttonText: String(localized: "GoToMenu").uppercased()))
    }
}
