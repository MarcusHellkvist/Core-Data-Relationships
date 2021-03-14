//
//  RegisterViewController.swift
//  Core Data Relationships
//
//  Created by Marcus Hellkvist on 2021-03-11.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBOutlet var firstnameField: UITextField!
    @IBOutlet var lastnameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var phoneField: UITextField!
    
    
    @IBOutlet var navBar: UINavigationBar!
    
    weak var delegate: UserDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func getRandomUserIdNumber() -> Int64 {
        return Int64.random(in: 0...1000)

    }
    
    @IBAction func CreateAccountButton(_ sender: UIButton) {
        
        let username = usernameField.text ?? "dev1"
        let password = passwordField.text ?? "dev1"
        let firstname = firstnameField.text ?? "dev1"
        let lastname = lastnameField.text ?? "dev1"
        let email = emailField.text ?? "dev1@gmail.com"
        let phone = Int64(phoneField.text!) ?? 0000
        
        let userId = getRandomUserIdNumber()
        
        DataManager.shared.createUser(username: username, password: password, firstname: firstname, lastname: lastname, email: email, phone: phone, userId: userId)
        DataManager.shared.saveContext()
        
        delegate?.updateUser()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func BackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
