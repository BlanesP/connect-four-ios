//
//  ViewController.swift
//  ConnectFour
//
//  Created by Pau Blanes on 23/11/21.
//

import UIKit

protocol GameViewControllerInput: AnyObject {
    func setUpBoardView(boardSize: BoardSize)
    func draw(chip: ChipViewModel, at slot: BoardPosition)
}

class GameViewController: UIViewController, AlertDisplayer {
    
    @IBOutlet weak var boardView: BoardView!
    
    var interactor: GameInteractor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor?.startGame()
    }
}

extension GameViewController: GameViewControllerInput {
    
    func setUpBoardView(boardSize: BoardSize) {
        
        boardView.setComponent(boardSize: boardSize) { index in
            self.interactor?.tap(at: index)
        }
    }
    
    func draw(chip: ChipViewModel, at slot: BoardPosition) {
        boardView.draw(chip: chip, at: slot)
    }
}

extension GameViewController: StoryboardInstantiator {
    
    static var storyboardName: String { "Main" }
    static var viewControllerId: String { "GameViewControllerId" }
}
