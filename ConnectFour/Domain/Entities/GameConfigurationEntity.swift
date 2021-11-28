//
//  GameConfigurationEntity.swift
//  ConnectFour
//
//  Created by BlanesP on 26/11/21.
//

import Foundation

struct GameConfigurationEntity: Decodable {
    let id: UInt64
    let color1: String
    let color2: String
    let name1: String
    let name2: String
}
