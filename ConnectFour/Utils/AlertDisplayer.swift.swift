//
//  ErrorDisplayer.swift.swift
//  ConnectFour
//
//  Created by BlanesP on 26/11/21.
//

import Foundation
import UIKit

typealias ButtonAction = () -> Void

protocol AlertDisplayer {
    func showAlert(title: String?, message: String?, btnText: String?, btnAction: ButtonAction?)
}

extension AlertDisplayer where Self: UIViewController {
    
    func showAlert(title: String?, message: String?, btnText: String?, btnAction: ButtonAction?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: btnText, style: .default, handler: { _ in
            btnAction?()
        }))
        
        self.present(alert, animated: true)
    }
}
