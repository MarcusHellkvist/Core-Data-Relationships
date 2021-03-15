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
        
        lessons = DataManager.shared.getLessonsForCourseId(courseId: (userCourse?.course!.courseId)!)
        lessonAmount = lessons.count
        
        getUserCourse()

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
    
}

extension ProgressionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lessonCell", for: indexPath) as! ProgressionTableViewCell
        
        let lesson = lessons[indexPath.row]
        
        cell.lessonTitleLabel.text = lesson.title
        cell.lessonLengthLabel.text = ("Estimated: \(String(lesson.length)) hours")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let progression = totalAmount / Double(lessonAmount)
        
        if userCourse!.progression >= 1.0 {
            userCourse?.progression = 1.0
        } else {
            userCourse?.progression += progression
        }
        DataManager.shared.saveContext()
        getUserCourse()
    }
    
    
}
