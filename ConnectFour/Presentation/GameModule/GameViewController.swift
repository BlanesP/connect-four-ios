//
//  ViewController.swift
//  ConnectFour
//
//  Created by Pau Blanes on 23/11/21.
//

import UIKit

protocol GameViewControllerInput: AnyObject {
    func setUpBoardView(gridSize: GridSize)
    func placeChip(at slot: Slot)
}

class GameViewController: UIViewController {
    
    @IBOutlet weak var boardView: BoardView!
    
    var interactor: GameViewControllerOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        interactor?.startGame()
    }
}

extension GameViewController: GameViewControllerInput {
    
    func setUpBoardView(gridSize: GridSize) {
        
        boardView.setComponent(gridSize: gridSize) { index in
            self.interactor?.tap(at: index)
        }
    }
    
    func placeChip(at slot: Slot) {        
        boardView.drawChip(at: slot)
    }
}
