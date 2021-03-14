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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //FIXA BÄTTRE NULL CHECK FÖR USER COURSE
        
        lessons = DataManager.shared.getLessonsForCourseId(courseId: (userCourse?.course!.courseId)!)
        print("\(lessons.count)")
        
        courseTitle.text = userCourse?.course?.title
        teacherLabel.text = userCourse?.course?.teacher
        progressView.setProgress(Float(userCourse!.progression), animated: true)
        progressViewLabel.text = ("\(userCourse!.progression * 100) % Complete")

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
        cell.lessonLengthLabel.text = String(lesson.length)
        
        return cell
    }
    
    
}
