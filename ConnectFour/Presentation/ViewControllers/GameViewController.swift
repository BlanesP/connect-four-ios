//
//  ViewController.swift
//  ConnectFour
//
//  Created by Pau Blanes on 23/11/21.
//

import UIKit

typealias ButtonAction = () -> Void

protocol GameViewControllerInput: AnyObject {
    func setUpBoardView(boardSize: BoardSize)
    func draw(chip: ChipViewModel, at slot: BoardPosition)
    func showAlert(title: String, message: String, btnText: String, btnAction: ButtonAction?)
}

class GameViewController: UIViewController {
    
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
    
    func showAlert(title: String, message: String, btnText: String, btnAction: ButtonAction?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: btnText, style: .default, handler: { _ in
            btnAction?()
        }))
        
        self.present(alert, animated: true)
    }
}

extension GameViewController: StoryboardInstantiator {
    
    static var storyboardName: String { "Main" }
    static var viewControllerId: String { "GameViewControllerId" }
}
