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
    
    @IBOutlet var tableView: UITableView!
    
    
    var userCourse: UserCourse?
    
    var lessons: [Lesson] = []
    var lessonAmount: Int = 0
    let totalAmount: Double = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setViewControllerStyle()
        
        lessons = DataManager.shared.getLessonsForCourseId(courseId: (userCourse?.course!.courseId)!)
        lessonAmount = lessons.count
        
        getUserCourse()

    }
    
    func setViewControllerStyle() {
        //STYLE
        view.layer.backgroundColor = UIColor.myBlue.cgColor
        progressView.progressTintColor = UIColor.myYellow
        courseTitle.textColor = UIColor.white
        teacherLabel.textColor = UIColor.white
        progressViewLabel.textColor = UIColor.white
        tableView.backgroundColor = UIColor.myBlue
    }
    
    func setText() {
        courseTitle.text = userCourse?.course?.title
        teacherLabel.text = userCourse?.course?.teacher
        progressView.setProgress(Float(userCourse!.progression), animated: true)
        progressViewLabel.text = ("\(userCourse!.progression * 100) % Complete")
    }
    
    func getUserCourse() {
        userCourse = DataManager.shared.getUserCourse(userCourse: userCourse!)
        setText()
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func reviewButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Not Implemented", message: "This function is not implemented at this moment.", preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
}

extension ProgressionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lessonCell", for: indexPath) as! ProgressionTableViewCell
        
        let lesson = lessons[indexPath.row]
        cell.delegate = self
        
        cell.lessonTitleLabel.text = lesson.title
        cell.lessonLengthLabel.text = ("Estimated: \(String(lesson.length)) hours")
        
        return cell
    }
    
}

extension ProgressionViewController: MyCellDelegate{
    func didTapButtonInCell(_ cell: ProgressionTableViewCell, cellButton: UIButton) {
        let progression = totalAmount / Double(lessonAmount)
        
        if userCourse!.progression >= 1.0 {
            userCourse?.progression = 1.0
        } else {
            userCourse?.progression += progression
        }
        DataManager.shared.saveContext()
        getUserCourse()
        cellButton.setTitle("Done!", for: .disabled)
        cellButton.isEnabled = false
    }
    
    
}
