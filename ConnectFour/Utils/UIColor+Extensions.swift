//
//  UIColor+Extensions.swift
//  ConnectFour
//
//  Created by BlanesP on 26/11/21.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        
        let hexString = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        }
        
        var color: UInt64 = 0
        guard scanner.scanHexInt64(&color) else {
            self.init(white: 0, alpha: 0)
            return
        }
        
        let mask = 0x000000FF
        let red   = CGFloat(Int(color >> 16) & mask) / 255.0
        let green = CGFloat(Int(color >> 8) & mask) / 255.0
        let blue  = CGFloat(Int(color) & mask) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}
