//
//  DefaultApiRepository.swift
//  ConnectFour
//
//  Created by BlanesP on 30/10/2021.
//

import Foundation
import Alamofire

enum MethodType: String {
    case GET = "GET"
    case POST = "POST"
}

final class DefaultApiRepository {
    
    weak var feedbackDisplayer: RepositoryFeedbackDisplayer?
    
    func makeRequest<OutParams: Decodable>(url: String,
                                           methodType: MethodType,
                                           completion: @escaping (OutParams?, CustomError?) -> Void) {
     
        feedbackDisplayer?.showLoader()
        
        AF.request(url, method: HTTPMethod(rawValue: methodType.rawValue))
            .responseDecodable(of: OutParams.self) { [weak self] response in
                
                self?.feedbackDisplayer?.hideLoader()
                self?.manageResponse(response: response, completion: completion)
        }
    }
    
    private func manageResponse<OutParams: Decodable>(response: DataResponse<OutParams, AFError>,
                                                      completion: @escaping (OutParams?, CustomError?) -> Void) {
            
            switch response.result {
            
            case .success(let decodedResponse):
                completion(decodedResponse, nil)
                
            case .failure(let error):
                var errorMsg = error.localizedDescription
                if let data = response.data,
                   let jsonData = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: String],
                   let error = jsonData["error"] {
                    
                    errorMsg = error
                }
                completion(nil, CustomError(statusCode: error.responseCode, description: errorMsg))
        }
    }
}
