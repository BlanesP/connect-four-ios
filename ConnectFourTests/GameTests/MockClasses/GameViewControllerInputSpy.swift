//
//  GameViewControllerInputSpy.swift
//  ConnectFourTests
//
//  Created by Pau Blanes on 27/11/21.
//

import Foundation
@testable import ConnectFour

class GameViewControllerInputSpy: GameViewControllerInput, AlertDisplayer {
    
    var didSetupBoard = false
    var boardSize: BoardSize?
    var titleMessage: String?
    
    var didDrawChip = false
    var chipViewModel: ChipViewModel?
    
    var didShowAlert = false
    var alertMessage: String?
    
    func setUpBoardView(boardSize: BoardSize) {
        didSetupBoard = true
        self.boardSize = boardSize
    }
    
    func draw(chip: ChipViewModel, at slot: BoardPosition) {
        didDrawChip = true
        chipViewModel = chip
    }
    
    func setTitle(with titleText: String) {
        titleMessage = titleText
    }
    
    func showAlert(title: String?, message: String?, btnText: String?, btnAction: ButtonAction?) {
        didShowAlert = true
        alertMessage = message
    }
}
