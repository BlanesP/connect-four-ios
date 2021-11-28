//
//  ResultView.swift
//  ConnectFour
//
//  Created by BlanesP on 28/11/21.
//

import UIKit

typealias ResultViewAction = () -> Void

class ResultView: UIView {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var resultAction: ResultViewAction?
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init? (coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {

        let view = Bundle.main.loadNibNamed("ResultView", owner: self, options: nil)?[0] as! UIView
        addSubview(view)
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        layer.borderWidth = 5
        layer.borderColor = UIColor(hexString: "#523A28").cgColor
        backgroundImage.image = UIImage(named: "result_backroung_image")
    }
    
    func setComponent(with viewModel: ResultViewModel, action: ResultViewAction?) {
        
        resultAction = action
        
        titleLabel.text = viewModel.titleText
        
        let font = UIFont.boldSystemFont(ofSize: 25)
        let attributes = [NSAttributedString.Key.font: font]
        button.setAttributedTitle(NSAttributedString(string: viewModel.buttonText, attributes: attributes), for: .normal)
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        resultAction?()
    }
}
