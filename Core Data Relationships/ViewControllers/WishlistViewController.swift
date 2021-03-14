//
//  WishlistViewController.swift
//  Core Data Relationships
//
//  Created by Marcus Hellkvist on 2021-03-11.
//

import UIKit

class WishlistViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    let cellIdentifier = "courseCell"
    
    let refreshControl = UIRefreshControl()
    
    var currentUser: User!
    var wishlist: [Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        view.layer.backgroundColor = UIColor.myBlue.cgColor
        tableView.backgroundColor = UIColor.myBlue
        
        
        refreshControl.addTarget(self, action: #selector(refreshTableView), for: .valueChanged)
        tableView.addSubview(refreshControl)
        
        currentUser = DataManager.shared.getCurrentUser()
        getWishlist()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        getWishlist()
    }
    
    func getWishlist() {
        wishlist.removeAll()
        if let wishlistCourses = currentUser.wishlist?.allObjects as? [Course] {
            wishlist = wishlistCourses
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @objc func refreshTableView(){
        getWishlist()
        refreshControl.endRefreshing()

    }
}

extension WishlistViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wishlist.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CourseTableViewCell
        
        let course = wishlist[indexPath.row]
        
        cell.titleLabel.text = course.title
        cell.teacherLabel.text = course.teacher
        cell.ratingImage.image = RatingModel.getRatingImage(number: course.rating)
        cell.priceLabel.text = ("\(course.price) kr")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let course = wishlist[indexPath.row]

        let alert = UIAlertController(title: "\(course.title!)", message: "What do you wanna do?", preferredStyle: .alert)

        let buyButton = UIAlertAction(title: "Buy", style: .default) { (action) in
            
            if DataManager.shared.createUserCourse(user: self.currentUser, course: course, status: 1){
                self.currentUser.removeFromWishlist(course)
                DataManager.shared.saveContext()
                self.getWishlist()
            }
            
        }
        let registerButton = UIAlertAction(title: "Register", style: .default) { (action) in
            
            if DataManager.shared.createUserCourse(user: self.currentUser, course: course, status: 2){
                self.currentUser.removeFromWishlist(course)
                DataManager.shared.saveContext()
                self.getWishlist()
            }
            
        }
        let deleteButton = UIAlertAction(title: "Remove from wishlist", style: .destructive) { (action) in
            self.currentUser.removeFromWishlist(course)
            DataManager.shared.saveContext()
            self.getWishlist()
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alert.addAction(buyButton)
        alert.addAction(registerButton)
        alert.addAction(deleteButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in

                let course = self.wishlist[indexPath.row]
                self.currentUser.removeFromWishlist(course)
                DataManager.shared.saveContext()
                self.getWishlist()

            }

        return UISwipeActionsConfiguration(actions: [action])
    }
    
    
}
