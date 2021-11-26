//
//  MainMenuRouter.swift
//  ConnectFour
//
//  Created by Pau Blanes on 26/11/21.
//

import Foundation
import UIKit

protocol MainMenuRouter {
    func goToGame()
}

final class DefaultMainMenuRouter {
    
    weak var viewController: UIViewController?
}

extension DefaultMainMenuRouter: MainMenuRouter {
    
    func goToGame() {
        
        let vc = GameFactory.createGameModule()
        vc.modalPresentationStyle = .fullScreen
        viewController?.present(vc, animated: true, completion: nil)
    }
}
