//
//  ViewController.swift
//  ConnectFour
//
//  Created by BlanesP on 23/11/21.
//

import UIKit

protocol GameViewControllerInput: AnyObject {
    func setUpBoardView(boardSize: BoardSize)
    func draw(chip: ChipViewModel, at slot: BoardPosition)
    func setTitle(with titleText: String)
    func showResultView(with viewModel: ResultViewModel)
}

class GameViewController: UIViewController, AlertDisplayer {
    
    private struct Constants {
        public static let backgroundImage = UIImage(named: "background_image")
    }
    
    @IBOutlet weak var boardView: BoardView!
    
    var interactor: GameInteractor?
    var router: GameRouter?
    
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
    
    func showResultView(with viewModel: ResultViewModel) {
        
        let resultView = ResultView(frame: CGRect(x: 0, y: 0, width: 500, height: 300))
        resultView.center = view.center
        resultView.setComponent(with: viewModel, action: router?.goToMenu)
        
        view.addSubview(resultView)
    }
}

extension GameViewController: StoryboardInstantiator {
    
    static var storyboardName: String { "Main" }
    static var viewControllerId: String { "GameViewControllerId" }
}
