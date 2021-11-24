//
//  BoardView.swift
//  ConnectFour
//
//  Created by Pau Blanes on 23/11/21.
//

import UIKit

typealias TapAction = (Int) -> Void

class BoardView: UIView {

    @IBOutlet weak var columnsStackView: UIStackView!
    
    var numColumns: CGFloat = 1
    var numRows: CGFloat = 1
    var tapAction: TapAction?
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init? (coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {

        let view = Bundle.main.loadNibNamed("BoardView", owner: self, options: nil)?[0] as! UIView
        addSubview(view)
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    //MARK: Public
    func setComponent(gridSize: GridSize, tapAction: @escaping TapAction) {
        
        self.tapAction = tapAction
        self.numRows = CGFloat(gridSize.numRows)
        self.numColumns = CGFloat(gridSize.numColumns)
        
        for i in 0..<gridSize.numColumns {
            columnsStackView.addArrangedSubview(createButton(tag: i))
        }
    }
    
    func drawChip(at slot: Slot) {
        
        let columnSize = bounds.size.width / numColumns
        let xPosition = CGFloat(slot.column) * columnSize
        
        let rowSize = bounds.size.height / numRows
        let yPosition = bounds.size.height - (CGFloat(slot.row) * rowSize)
        
        let size = min(rowSize, columnSize)
        
        let newChip = UIView()
        newChip.frame = CGRect(x: 0, y: 0, width: size, height: size)
        newChip.isUserInteractionEnabled = false
        newChip.backgroundColor = .red
        newChip.layer.cornerRadius = size / 2
        newChip.center = CGPoint(x: xPosition, y: yPosition)
        addSubview(newChip)
    }
    
    //MARK: Utils
    func createButton(tag: Int) -> UIButton {
        
        let button = UIButton()
        button.tag = tag
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        return button
    }
    
    //MARK: Actions
    @objc func buttonTapped(sender: UIButton) {
        tapAction?(sender.tag)
    }
}
