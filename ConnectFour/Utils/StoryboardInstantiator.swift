//
//  StoryboardInstantiator.swift
//  ConnectFour
//
//  Created by BlanesP on 26/11/21.
//

import Foundation
import UIKit

protocol StoryboardInstantiator {
    static func getStoryboardInstance() -> Self
    
    static var storyboardName: String { get }
    static var viewControllerId: String { get }
}

extension StoryboardInstantiator where Self: UIViewController {
    
    static func getStoryboardInstance() -> Self {
        
        let sb = UIStoryboard(name: storyboardName, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: viewControllerId)
        
        return vc as! Self
    }
}
