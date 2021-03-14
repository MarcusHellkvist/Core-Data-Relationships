//
//  ProgressionViewController.swift
//  Core Data Relationships
//
//  Created by Marcus Hellkvist on 2021-03-14.
//

import UIKit

class ProgressionViewController: UIViewController {
    
    
    @IBOutlet var courseTitle: UILabel!
    @IBOutlet var teacherLabel: UILabel!
    
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var progressViewLabel: UILabel!
    
    var userCourse: UserCourse?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        courseTitle.text = userCourse?.course?.title
        teacherLabel.text = userCourse?.course?.teacher
        progressView.setProgress(Float(userCourse!.progression), animated: true)
        progressViewLabel.text = ("\(userCourse!.progression * 100) % Complete")

    }
    

}
