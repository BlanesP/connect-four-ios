//
//  MainMenuViewControllerTests.swift
//  ConnectFourTests
//
//  Created by BlanesP on 28/11/21.
//

import XCTest
@testable import ConnectFour

class MainMenuViewControllerTests: XCTestCase {

    var viewcontroller: MainMenuViewController!
    var interactor: MainMenuInteractorSpy!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        viewcontroller = MainMenuViewController.getStoryboardInstance()
        interactor = MainMenuInteractorSpy()
        viewcontroller.interactor = interactor
    }

    func testPlayButtonPress() {
        
        _ = viewcontroller.view
        
        viewcontroller.playButton.sendActions(for: .touchUpInside)
        
        XCTAssertTrue(interactor.didCallPlay)
    }

}

class MainMenuInteractorSpy: MainMenuInteractor {
    
    var didCallPlay = false
    
    func play() {
        didCallPlay = true
    }
}
