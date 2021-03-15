//
//  HideKeyboard.swift
//  Core Data Relationships
//
//  Created by Marcus Hellkvist on 2021-03-15.
//

import Foundation
import UIKit

extension UIViewController {
    // Controls the keyboard
    func hideKeyboardWhenTappedOutside() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}
