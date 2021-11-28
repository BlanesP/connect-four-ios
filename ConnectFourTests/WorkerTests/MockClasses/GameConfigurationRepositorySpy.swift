//
//  GameConfigurationRepositorySpy.swift
//  ConnectFourTests
//
//  Created by Pau Blanes on 28/11/21.
//

import Foundation
@testable import ConnectFour

enum PossibleRepositoryOutcomes {
    case success
    case error
    case successAndError
    case noSuccessNoError
}

class GameConfigurationRepositorySpy: GameConfigurationRepository {
    
    var didCallGetGameConfig = false
    var outcome: PossibleRepositoryOutcomes = .success
    
    func getGameConfiguration(completion: @escaping ([GameConfigurationEntity]?, CustomError?) -> Void) {
        
        didCallGetGameConfig = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            let gameEntity = GameConfigurationEntity(id: 0, color1: "color1", color2: "color2", name1: "name1", name2: "name2")
            let error = CustomError(statusCode: 1234, description: "Test error")
            
            switch self.outcome {
            case .success:
                completion([gameEntity], nil)
            case .error:
                completion(nil, error)
            case .successAndError:
                completion([gameEntity], error)
            case .noSuccessNoError:
                completion(nil, nil)
            }
        }
    }
}
