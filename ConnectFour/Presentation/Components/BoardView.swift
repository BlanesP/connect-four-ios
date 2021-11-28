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
    func setComponent(boardSize: BoardSize, tapAction: @escaping TapAction) {
        
        self.tapAction = tapAction
        self.numRows = CGFloat(boardSize.numRows)
        self.numColumns = CGFloat(boardSize.numColumns)
        
        for i in 0..<boardSize.numColumns {
            columnsStackView.addArrangedSubview(createButton(tag: i))
        }
    }
    
    func draw(chip: ChipViewModel, at slot: BoardPosition) {
        
        let chipDimensions = dimensionsForChip(at: slot)
        
        let newChip = UIView()
        newChip.frame = CGRect(x: 0, y: 0, width: chipDimensions.size, height: chipDimensions.size)
        newChip.isUserInteractionEnabled = false
        newChip.backgroundColor = chip.color
        newChip.layer.cornerRadius = chipDimensions.size / 2
        newChip.center = chipDimensions.position
        addSubview(newChip)
    }
    
    //MARK: Utils
    private func dimensionsForChip(at slot: BoardPosition) -> (position: CGPoint, size: CGFloat) {
        
        let currentColumnView = columnsStackView.arrangedSubviews[slot.column]
        let chipSize = min(currentColumnView.frame.width, currentColumnView.frame.height / numRows)
        
        let xPosition = currentColumnView.frame.midX
        let yPosition = (currentColumnView.frame.maxY - chipSize/2) - (chipSize * CGFloat(slot.row))
        
        return (position: CGPoint(x: xPosition, y: yPosition), size: chipSize)
    }
    
    private func createButton(tag: Int) -> UIButton {
        
        let button = UIButton()
        button.tag = tag
        button.backgroundColor = .black
        button.alpha = 0.5
        button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        return button
    }
    
    //MARK: Actions
    @objc func buttonTapped(sender: UIButton) {
        tapAction?(sender.tag)
    }
}
