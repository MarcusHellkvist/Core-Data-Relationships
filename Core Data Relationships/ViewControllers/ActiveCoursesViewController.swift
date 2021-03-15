//
//  ActiveCoursesViewController.swift
//  Core Data Relationships
//
//  Created by Marcus Hellkvist on 2021-03-11.
//

import UIKit

class ActiveCoursesViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let cellIdentifier = "activeCell"
    
    var currentUser: User!
    //var activeCourses: [UserCourse] = []
    
    var userBoughtCourses: [UserCourse] = [UserCourse]()
    var userEnrolledCourses: [UserCourse] = [UserCourse]()
    var allCourses: [[UserCourse]] = [[UserCourse]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.layer.backgroundColor = UIColor.myBlue.cgColor
        tableView.backgroundColor = UIColor.myBlue
        
        currentUser = DataManager.shared.getCurrentUser()
        getAllCourses()
        print("Total: \(allCourses.count) Bought: \(userBoughtCourses.count) Registered: \(userEnrolledCourses.count)")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("view did appear")
        getAllCourses()
    }
    
    func getAllCourses() {
        // CLEAN ALL ARRAYS
        userBoughtCourses.removeAll()
        userEnrolledCourses.removeAll()
        allCourses.removeAll()
        
        userBoughtCourses = DataManager.shared.getBoughtCourses(user: currentUser)
        print("fetched: \(userBoughtCourses.count) bought courses")
        allCourses.append(userBoughtCourses)
        
        userEnrolledCourses = DataManager.shared.getEnrolledCourses(user: currentUser)
        print("fetched: \(userEnrolledCourses.count) enrolled courses")
        allCourses.append(userEnrolledCourses)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }

}

extension ActiveCoursesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 50))
        returnedView.backgroundColor = UIColor.myBlue
        
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: self.view.bounds.size.width, height: 50))
        
        switch section {
        case 0:
            label.text = "Bought"
        case 1:
            label.text = "Registered"
        default:
            label.text = "Unknown"
        }
        
        label.textColor = UIColor.white
        returnedView.addSubview(label)
        
        return returnedView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return allCourses.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCourses[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ActiveCourseTableViewCell
        
        let userCourse = allCourses[indexPath.section][indexPath.row]
        
        cell.titleLabel.text = userCourse.course?.title
        cell.teacherLabel.text = userCourse.course?.teacher
        cell.progressView.setProgress(Float(userCourse.progression), animated: true)
        cell.progressLabel.text = ("\(userCourse.progression * 100) % Complete")

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userCourse = allCourses[indexPath.section][indexPath.row]
        
        performSegue(withIdentifier: "progressSegue", sender: userCourse)
        
//        if userCourse.progression >= 1.0 {
//            userCourse.progression = 1.0
//        } else {
//            userCourse.progression += 0.1
//        }
//
//        tableView.reloadData()
//        DataManager.shared.saveContext()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "progressSegue" {
            guard let destVC = segue.destination as? ProgressionViewController else { return }
            guard let userCourse = sender as? UserCourse else { return }
            destVC.userCourse = userCourse
        }
    }
    
}
