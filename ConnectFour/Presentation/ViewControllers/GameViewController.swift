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
    func setTitle(with titleText: String)
}

class GameViewController: UIViewController, AlertDisplayer {
    
    private struct Constants {
        public static let backgroundImage = UIImage(named: "background_image")
    }
    
    @IBOutlet weak var boardView: BoardView!
    
    var interactor: GameInteractor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let bgImg = Constants.backgroundImage { view.backgroundColor = UIColor(patternImage: bgImg) }
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
    
    func setTitle(with titleText: String) {
        self.title = titleText
    }
}

extension GameViewController: StoryboardInstantiator {
    
    static var storyboardName: String { "Main" }
    static var viewControllerId: String { "GameViewControllerId" }
}
