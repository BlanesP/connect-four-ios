//
//  GameViewControllerInputSpy.swift
//  ConnectFourTests
//
//  Created by BlanesP on 27/11/21.
//

import Foundation
@testable import ConnectFour

class GameViewControllerInputSpy: GameViewControllerInput, AlertDisplayer {
    
    var boardSize: BoardSize?
    var titleMessage: String?
    var chipViewModel: ChipViewModel?
    var alertMessage: String?
    var resultViewModel: ResultViewModel?
    
    func setUpBoardView(boardSize: BoardSize) {
        self.boardSize = boardSize
    }
    
    func draw(chip: ChipViewModel, at slot: BoardPosition) {
        chipViewModel = chip
    }
    
    func setTitle(with titleText: String) {
        titleMessage = titleText
    }
    
    func showAlert(title: String?, message: String?, btnText: String?, btnAction: ButtonAction?) {
        alertMessage = message
    }
    
    func showResultView(with viewModel: ResultViewModel) {
        resultViewModel = viewModel
    }
}
