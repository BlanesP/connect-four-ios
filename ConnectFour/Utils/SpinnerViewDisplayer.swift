//
//  RepositoryFeedbackDisplayer+Extensions.swift
//  ConnectFour
//
//  Created by BlanesP on 28/11/21.
//

import Foundation
import UIKit
import Lottie

protocol SpinnerViewDisplayer: RepositoryFeedbackDisplayer {
    var spinnerView: UIView? { get set }
}

extension SpinnerViewDisplayer where Self : UIViewController {
    
    func showLoader() {
        
        guard spinnerView == nil else { return }
        
        DispatchQueue.main.async {
            
            self.spinnerView = self.createSpinnerView()
            self.view.addSubview(self.spinnerView!)
        }
    }
    
    func hideLoader() {
        
        guard let spinnerView = self.spinnerView else { return }
        
        DispatchQueue.main.async {
            spinnerView.removeFromSuperview()
            self.spinnerView = nil
        }
    }
    
    func createSpinnerView() -> UIView {
        
        let spinnerView = UIView(frame: view.bounds)
        let black = UIColor.black
        spinnerView.backgroundColor = black.withAlphaComponent(0.3)
        spinnerView.center = self.view.center
        
        let animationView: AnimationView = .init(name: "spinner")
        animationView.frame = CGRect(x: 0, y: 0, width: 240, height: 240)
        animationView.center = spinnerView.center
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        
        spinnerView.addSubview(animationView)
        animationView.play()
        
        return spinnerView
    }
}
