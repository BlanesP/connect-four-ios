//
//  ApiRepository.swift
//  ConnectFour
//
//  Created by Pau Blanes on 26/11/21.
//

import Foundation

fileprivate let endpoint = "https://private-75c7a5-blinkist.apiary-mock.com/connectFour"

//The idea of this interface is that the Workers should not be concerned about endpoints or methodTypes
protocol ApiRepository {
    func getGameConfiguration(completion: @escaping ([GameConfigurationEntity]?, CustomError?) -> Void)
}

extension DefaultApiRepository: ApiRepository {
    
    func getGameConfiguration(completion: @escaping ([GameConfigurationEntity]?, CustomError?) -> Void) {
        
        makeRequest(url: "\(endpoint)/configuration",
                    methodType: .GET,
                    completion: completion)
    }
}
