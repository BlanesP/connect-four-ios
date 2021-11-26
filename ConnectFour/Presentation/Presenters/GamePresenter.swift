//
//  GamePresenter.swift
//  ConnectFour
//
//  Created by Pau Blanes on 25/11/21.
//

import Foundation
import UIKit

protocol GamePresenter {
    func startGame(with boardSize: BoardSize)
    func player(_ player: Player, placedChipAt slot: BoardPosition)
    func columnIsFull()
    func gameEndedInDraw()
    func gameWon(by player: Player)
}

final class DefaultGamePresenter {
    
    weak var viewController: (GameViewControllerInput & AlertDisplayer)?
}

extension DefaultGamePresenter: GamePresenter {
    
    func startGame(with boardSize: BoardSize) {
        //Here you could add animations, labels, anything that the view needs to visually display at the start of the game
        viewController?.setUpBoardView(boardSize: boardSize)
    }
    
    func player(_ player: Player, placedChipAt slot: BoardPosition) {
        viewController?.draw(chip: ChipViewModel(color: UIColor(hexString: player.colorHex, alpha: 1)), at: slot)
    }
    
    func columnIsFull() {
        viewController?.showAlert(title: String(localized: "Attention"), message: String(localized: "ColumnFull"), btnText: String(localized: "OK"), btnAction: nil)
    }
    
    func gameEndedInDraw() {
        viewController?.showAlert(title: String(localized: "GameOver"), message: String(localized: "ItsDraw"), btnText: String(localized: "OK"), btnAction: nil)
    }
    
    func gameWon(by player: Player) {
        viewController?.showAlert(title: String(localized: "GameOver"), message: String(format: String(localized: "PlayerWins"), player.name) , btnText: String(localized: "OK"), btnAction: nil)
    }
}
