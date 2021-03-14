//
//  CourseDetailsViewController.swift
//  Core Data Relationships
//
//  Created by Marcus Hellkvist on 2021-03-11.
//

import UIKit

class CourseDetailsViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var teacherLabel: UILabel!
    @IBOutlet var descLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var lengthLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var interestedStudentsLabel: UILabel!
    @IBOutlet var ratingImage: UIImageView!
    
    @IBOutlet var wishlistButton: UIButton!
    
    var course: Course?
    var currentUser: User?
    weak var delegate: CourseDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //STYLE
        view.layer.backgroundColor = UIColor.myBlue.cgColor
        titleLabel.textColor = UIColor.white
        descLabel.textColor = UIColor.white
        teacherLabel.textColor = UIColor.white
        lengthLabel.textColor = UIColor.white
        priceLabel.textColor = UIColor.white
        interestedStudentsLabel.textColor = UIColor.white
        
        setupDetailCourse()
        currentUser = DataManager.shared.getCurrentUser()
        

    }
    
    func setupDetailCourse() {
        
        if let course = course {
            titleLabel.text = course.title
            descLabel.text = course.desc
            lengthLabel.text = ("Estimated time: \(course.length) hours")
            teacherLabel.text = course.teacher
            ratingImage.image = RatingModel.getRatingImage(number: course.rating)
            priceLabel.text = ("\(course.price) kr")
            interestedStudentsLabel.text = ("\(course.users?.count ?? 0) students are interested in this course!")
            
        } else {
            print("course is nil")
        }
        
    }
    
    @IBAction func WishlistButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Wishlish", message: "Course has been added to your wishlish", preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "Ok", style: .default) { (action) in
            
            self.delegate?.addToWishlist(course: self.course!)
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
        
    }
    @IBAction func EnrollButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Enrolled", message: "You are now registered for this course", preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.delegate?.addToEnrolled(course: self.course!)
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
        
    }
    @IBAction func BuyButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Buy Course", message: "Do you want to buy this course?", preferredStyle: .alert)
        let buyButton = UIAlertAction(title: "Buy", style: .default) { (action) in
            self.delegate?.addToBought(course: self.course!)
            self.dismiss(animated: true, completion: nil)
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(buyButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}
