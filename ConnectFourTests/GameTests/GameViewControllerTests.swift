//
//  GameViewControllerTests.swift
//  ConnectFourTests
//
//  Created by Pau Blanes on 27/11/21.
//

import XCTest
@testable import ConnectFour

class GameViewControllerTests: XCTestCase {

    var viewController: GameViewController!
    var interactorSpy: GameInteractorSpy!
    
    override func setUpWithError() throws {
        
        viewController = GameViewController.getStoryboardInstance()
        interactorSpy = GameInteractorSpy()
        viewController.interactor = interactorSpy
    }
    
    func testLoadGameWhenViewIsLoaded() {
        
        _ = viewController.view
        
        XCTAssertTrue(interactorSpy.didCallLoadGame)
    }
}
