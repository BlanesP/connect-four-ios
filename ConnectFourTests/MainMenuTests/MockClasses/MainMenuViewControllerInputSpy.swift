//
//  MainMenuViewControllerInputSpy.swift
//  ConnectFourTests
//
//  Created by BlanesP on 28/11/21.
//

import Foundation
@testable import ConnectFour

class MainMenuViewControllerInputSpy: MainMenuViewControllerInput, AlertDisplayer {
    
    var didCallGoToGame = false
    var alertTitle: String?
    var alertMessage: String?
    
    func goToGame() {
        didCallGoToGame = true
    }
    
    func showAlert(title: String?, message: String?, btnText: String?, btnAction: ButtonAction?) {
        
        alertTitle = title
        alertMessage = message
    }
}
