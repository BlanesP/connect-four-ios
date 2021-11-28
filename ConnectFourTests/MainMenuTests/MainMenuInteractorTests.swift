//
//  MainMenuInteractorTests.swift
//  ConnectFourTests
//
//  Created by Pau Blanes on 28/11/21.
//

import XCTest
@testable import ConnectFour

class MainMenuInteractorTests: XCTestCase {

    var interactor: MainMenuInteractor!
    var presenterSpy: MainMenuPresenterSpy!
    var workerSpy: GameConfigurationWorkerSpy!
    
    override func setUpWithError() throws {
        
        presenterSpy = MainMenuPresenterSpy()
        workerSpy = GameConfigurationWorkerSpy()
        interactor = DefaultMainMenuInteractor(presenter: presenterSpy, worker: workerSpy)
    }
    
    func testPlayWithSuccess() {
        
        workerSpy.forceError = false
        
        interactor.play()
        
        XCTAssertTrue(workerSpy.didCallFetchConfig)
        XCTAssertTrue(presenterSpy.didCallSuccededToDownloadConfig)
        XCTAssertFalse(presenterSpy.didCallFailedToDownloadConfig)
    }
    
    func testPlayWithError() {
        
        workerSpy.forceError = true
        
        interactor.play()
        
        XCTAssertTrue(workerSpy.didCallFetchConfig)
        XCTAssertTrue(presenterSpy.didCallFailedToDownloadConfig)
        XCTAssertFalse(presenterSpy.didCallSuccededToDownloadConfig)
    }
}
