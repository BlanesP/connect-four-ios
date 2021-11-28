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

class MainMenuViewController: UIViewController, AlertDisplayer, SpinnerViewDisplayer {

    private struct Constants {
        
        public static let backgroundImage = UIImage(named: "background_image")
        public static let titleText = String(localized: "ConnectFourTitle")
        public static let buttonImage = UIImage(named: "play_btn")
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    var spinnerView: UIView?
    var interactor: MainMenuInteractor?
    var router: MainMenuRouter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let bgImg = Constants.backgroundImage { view.backgroundColor = UIColor(patternImage: bgImg) }
        titleLabel.text = Constants.titleText
        playButton.setImage(Constants.buttonImage, for: .normal)
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


