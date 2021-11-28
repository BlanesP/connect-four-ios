//
//  MainMenuPresenterTests.swift
//  ConnectFourTests
//
//  Created by Pau Blanes on 28/11/21.
//

import XCTest
@testable import ConnectFour

class MainMenuPresenterTests: XCTestCase {

    var presenter: MainMenuPresenter!
    var viewControllerInputSpy: MainMenuViewControllerInputSpy!
    
    override func setUpWithError() throws {
        
        let defaultPresenter = DefaultMainMenuPresenter()
        viewControllerInputSpy = MainMenuViewControllerInputSpy()
        defaultPresenter.viewController = viewControllerInputSpy
        presenter = defaultPresenter
    }
    
    func testConfigDownloadSuccess() {
        
        presenter.succededToDownloadGameConfig()
        
        XCTAssertTrue(viewControllerInputSpy.didCallGoToGame)
    }
    
    func testConfigDownloadFailure() {
        
        let error = CustomError(statusCode: 1234, description: "This is a test error")
        
        presenter.failedToDownloadGameConfig(with: error)
        
        XCTAssertEqual(viewControllerInputSpy.alertTitle, "1234")
        XCTAssertEqual(viewControllerInputSpy.alertMessage, "This is a test error")
    }
}
