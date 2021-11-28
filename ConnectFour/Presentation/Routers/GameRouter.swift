//
//  GameRouter.swift
//  ConnectFour
//
//  Created by BlanesP on 28/11/21.
//

import Foundation
import UIKit

protocol GameRouter {
    func goToMenu()
}

final class DefaultGameRouter {
    
    weak var viewController: UIViewController?
}

extension DefaultGameRouter: GameRouter {
    
    func goToMenu() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
