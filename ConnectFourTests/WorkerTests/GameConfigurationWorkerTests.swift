//
//  GameConfigurationWorkerTests.swift
//  ConnectFourTests
//
//  Created by BlanesP on 28/11/21.
//

import XCTest
@testable import ConnectFour

class GameConfigurationWorkerTests: XCTestCase {

    var repositorySpy: GameConfigurationRepositorySpy!
    var worker: GameConfigurationWorker!
    
    override func setUpWithError() throws {
        
        repositorySpy = GameConfigurationRepositorySpy()
        let defaultWorker = DefaultGameConfigurationWorker(apiRepository: repositorySpy)
        worker = defaultWorker
    }
    
    func testFetchGameConfigWithSuccess() {
        
        repositorySpy.outcome = .success
        let expectation = expectation(description: "Wait for game config info")
        var expectedResult: GameConfigurationEntity?
        var expectedError: CustomError?
        
        worker.fetchGameConfiguration { gameConfig in
            expectedResult = gameConfig
            expectation.fulfill()
        } failure: { error in
            expectedError = error
            expectation.fulfill()
        }
        
        XCTAssertTrue(repositorySpy.didCallGetGameConfig)
        waitForExpectations(timeout: 1.1) { error in
            XCTAssertNotNil(expectedResult)
            XCTAssertNil(expectedError)
        }
    }
    
    func testFetchGameConfigWithError() {
        
        repositorySpy.outcome =  .error
        let expectation = expectation(description: "Wait for game config error")
        var expectedResult: GameConfigurationEntity?
        var expectedError: CustomError?
        
        worker.fetchGameConfiguration { gameConfig in
            expectedResult = gameConfig
            expectation.fulfill()
        } failure: { error in
            expectedError = error
            expectation.fulfill()
        }
        
        XCTAssertTrue(repositorySpy.didCallGetGameConfig)
        waitForExpectations(timeout: 1.1) { error in
            XCTAssertNil(expectedResult)
            XCTAssertNotNil(expectedError)
        }
    }
    
    func testFechGameConfigWithResultAndError() {
        
        repositorySpy.outcome =  .successAndError
        let expectation = expectation(description: "Wait for game config error")
        var expectedResult: GameConfigurationEntity?
        var expectedError: CustomError?
        
        worker.fetchGameConfiguration { gameConfig in
            expectedResult = gameConfig
            expectation.fulfill()
        } failure: { error in
            expectedError = error
            expectation.fulfill()
        }
        
        XCTAssertTrue(repositorySpy.didCallGetGameConfig)
        waitForExpectations(timeout: 1.1) { error in
            XCTAssertNil(expectedResult)
            XCTAssertNotNil(expectedError)
        }
    }
    
    func testFechGameConfigWithNilResult() {
        
        repositorySpy.outcome = .noSuccessNoError
        let expectation = expectation(description: "Wait for game config default error")
        var expectedResult: GameConfigurationEntity?
        var expectedError: CustomError?
        
        worker.fetchGameConfiguration { gameConfig in
            expectedResult = gameConfig
            expectation.fulfill()
        } failure: { error in
            expectedError = error
            expectation.fulfill()
        }
        
        XCTAssertTrue(repositorySpy.didCallGetGameConfig)
        waitForExpectations(timeout: 1.1) { error in
            XCTAssertNil(expectedResult)
            XCTAssertNotNil(expectedError)
            XCTAssertEqual(expectedError?.statusCode, CustomError.defaultError.statusCode)
            XCTAssertEqual(expectedError?.description, CustomError.defaultError.description)
        }
    }
}
