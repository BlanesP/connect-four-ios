//
//  GameConfigurationWorker.swift
//  ConnectFour
//
//  Created by Pau Blanes on 26/11/21.
//

import Foundation

protocol GameConfigurationWorker {
    func fetchGameConfiguration(success: @escaping (GameConfigurationEntity) -> Void, failure: @escaping (CustomError) -> Void)
}

final class DefaultGameConfigurationWorker {
    
    let apiRepisotory: DefaultApiRepository
    
    init(apiRepository: DefaultApiRepository) {
        self.apiRepisotory = apiRepository
    }
}

extension DefaultGameConfigurationWorker: GameConfigurationWorker {
    
    func fetchGameConfiguration(success: @escaping (GameConfigurationEntity) -> Void, failure: @escaping (CustomError) -> Void) {
        
        apiRepisotory.getGameConfiguration { gameConfigList, error in
            
            if let error = error {
                failure(error)
            } else if let gameConfigList = gameConfigList, gameConfigList.count > 0 {
                success(gameConfigList[0])
            } else {
                failure(CustomError.defaultError)
            }
            
        }
    }
}
