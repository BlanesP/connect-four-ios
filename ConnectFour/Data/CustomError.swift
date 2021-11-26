//
//  CustomError.swift
//  ConnectFour
//
//  Created by Pau Blanes on 31/10/2021.
//

import Foundation

struct CustomError {
    let statusCode: Int?
    let description: String?
    
    static var defaultError: CustomError {
        return CustomError(statusCode: 9999, description: "Ups! Something went wrong")
    }
}
