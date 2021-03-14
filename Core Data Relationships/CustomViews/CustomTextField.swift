//
//  CustomTextField.swift
//  Core Data Relationships
//
//  Created by Marcus Hellkvist on 2021-03-13.
//

import UIKit

class CustomTextField: UITextField {
    
    override func draw(_ rect: CGRect) {
        
        //BORDER
        self.layer.borderColor = UIColor.myBlue.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 8
        
        //BACKGROUND
        self.layer.backgroundColor = UIColor.white.cgColor
        
        //TEXT
        self.textColor = UIColor.myBlue
        
        self.layer.masksToBounds = true
        
        // Drawing code
    }

}
