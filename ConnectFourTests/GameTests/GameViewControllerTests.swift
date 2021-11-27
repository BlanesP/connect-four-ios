//
//  GameViewControllerTests.swift
//  ConnectFourTests
//
//  Created by Pau Blanes on 27/11/21.
//

import XCTest
@testable import ConnectFour

class GameViewControllerTests: XCTestCase {

    func testLoadGameWhenViewIsLoaded() {
        
        let viewController = GameViewController.getStoryboardInstance()
        let interactorSpy = GameInteractorSpy()
        viewController.interactor = interactorSpy
        
        _ = viewController.view
        
        XCTAssertTrue(interactorSpy.didCallLoadGame)
    }
}
