//
//  GameConfigurationWorkerSpy.swift
//  ConnectFourTests
//
//  Created by Pau Blanes on 28/11/21.
//

import Foundation
@testable import ConnectFour

class GameConfigurationWorkerSpy: GameConfigurationWorker {
    
    var didCallFetchConfig = false
    var forceError = false
    
    func fetchGameConfiguration(success: @escaping (GameConfigurationEntity) -> Void, failure: @escaping (CustomError) -> Void) {
        
        didCallFetchConfig = true
        forceError ? failure(CustomError(statusCode: 0, description: "")) : success(GameConfigurationEntity(id: 0, color1: "", color2: "", name1: "", name2: ""))
    }
}
