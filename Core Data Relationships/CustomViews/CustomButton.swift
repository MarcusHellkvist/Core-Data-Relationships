//
//  CustomButton.swift
//  Core Data Relationships
//
//  Created by Marcus Hellkvist on 2021-03-13.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {

    // DEFAULT VALUES FOR BUTTON
    @IBInspectable var borderColor: UIColor = UIColor.black
    @IBInspectable var borderWidth: CGFloat = 0
    @IBInspectable var cornerRadius: CGFloat = 8
    @IBInspectable var buttonBackgroundColor: UIColor = UIColor.myButtonBlue
    @IBInspectable var buttonTextColor: UIColor = UIColor.myWhite
    
    private let border = CAShapeLayer()
    
    override func draw(_ rect: CGRect) {
        border.lineWidth = borderWidth
        border.frame = self.bounds
        border.fillColor = nil
        border.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
        border.lineDashPattern = nil
        border.strokeColor = borderColor.cgColor
        
        self.layer.backgroundColor = buttonBackgroundColor.cgColor
        self.setTitleColor(buttonTextColor, for: .normal)
        self.layer.addSublayer(border)
        
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }

}
