//
//  RepositoryFeedbackDisplayer.swift
//  ConnectFour
//
//  Created by Pau Blanes on 28/11/21.
//

import Foundation

protocol RepositoryFeedbackDisplayer: AnyObject {
    func showLoader()
    func hideLoader()
}
