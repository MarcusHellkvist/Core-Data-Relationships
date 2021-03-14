//
//  LoginViewController.swift
//  Core Data Relationships
//
//  Created by Marcus Hellkvist on 2021-03-11.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //DataManager.shared.deleteAllUsers()
        //DataManager.shared.deleteAllCourses()
        
        // OVERALL CHANGES TO THE APP
        UITabBar.appearance().tintColor = UIColor.myYellow
        UITabBar.appearance().barTintColor = UIColor.myBlue
        UINavigationBar.appearance().barTintColor = UIColor.myBlue
        UINavigationBar.appearance().tintColor = UIColor.myBlue
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = true
        
        users = DataManager.shared.getUsers()
        for u in users {
            print("\(u.username) \(u.userId)")
        }

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "registerSegue" {
            guard let destVC = segue.destination as? RegisterViewController else { return }
            destVC.delegate = self
        }
    }
    
    @IBAction func LoginButton(_ sender: UIButton) {
        
        let username = usernameField.text
        let password = passwordField.text
        
        if users.isEmpty {
            print("No customers registered yet.")
            return
        }
        
        for user in users {
            if user.username == username && user.password == password {
                print("Signing in. Please Wait.")
                DataManager.shared.currentUserId = user.userId
                performSegue(withIdentifier: "coursesSegue", sender: self)
            } else {
                print("Something went wrong.")
            }
        }
        
        
    }
    
    @IBAction func RegisterButton(_ sender: UIButton) {
        performSegue(withIdentifier: "registerSegue", sender: nil)
    }
    
}

extension LoginViewController: UserDelegate{
    func updateUser() {
        users = DataManager.shared.getUsers()
    }

}
