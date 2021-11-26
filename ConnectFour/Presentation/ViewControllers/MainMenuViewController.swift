//
//  MainMenuViewController.swift
//  ConnectFour
//
//  Created by Pau Blanes on 26/11/21.
//

import UIKit

protocol MainMenuViewControllerInput: AnyObject {
    func goToGame()
}

class MainMenuViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    
    var interactor: MainMenuInteractor?
    var router: MainMenuRouter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Actions
    @IBAction func playButtonPressed(_ sender: Any) {
        interactor?.play()
    }
}

extension MainMenuViewController: MainMenuViewControllerInput {
    
    func goToGame() {
        router?.goToGame()
    }
}

extension MainMenuViewController: StoryboardInstantiator {
    
    static var storyboardName: String { "Main" }
    static var viewControllerId: String { "MainMenuViewControllerId" }
}


