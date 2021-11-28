//
//  MainMenuPresenterSpy.swift
//  ConnectFourTests
//
//  Created by BlanesP on 28/11/21.
//

import Foundation
@testable import ConnectFour

class MainMenuPresenterSpy: MainMenuPresenter {
    
    var didCallSuccededToDownloadConfig = false
    var didCallFailedToDownloadConfig = false
    
    func succededToDownloadGameConfig() {
        didCallSuccededToDownloadConfig = true
    }
    
    func failedToDownloadGameConfig(with error: CustomError) {
        didCallFailedToDownloadConfig = true
    }
}
