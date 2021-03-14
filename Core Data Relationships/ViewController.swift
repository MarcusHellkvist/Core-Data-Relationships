////
////  ViewController.swift
////  Core Data Relationships
////
////  Created by Marcus Hellkvist on 2021-03-10.
////
//
//import UIKit
//import CoreData
//
//class ViewController: UIViewController {
//
//    @IBOutlet var userNameLabel: UILabel!
//    @IBOutlet var tableView: UITableView!
//
//    let context = (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext
//
//    var userCourseArray: [UserCourse] = [UserCourse]()
//    var userCourse2: [UserCourse] = [UserCourse]()
//    var boughtCourses: [Course] = [Course]()
//    var currentUser: User?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        tableView.dataSource = self
//        tableView.delegate = self
//
//
////        deleteAllUserCourse()
////        deleteAllCourses()
////        deleteAllUsers()
//
//        //createData()
//        currentUser = getCurrentUser()
//
//        userNameLabel.text = currentUser?.name
//
//
//        // GET USERCOURSES!
//
//
//        if let courses = currentUser?.courses?.allObjects as? [Course] {
//
//            for c in courses {
//                let userCourse = UserCourse(context: context)
//                userCourse.user = currentUser
//                userCourse.course = c
//                userCourseArray.append(userCourse)
//            }
//            do{
//                try context.save()
//            } catch {
//                print("ERROR")
//            }
//
//            tableView.reloadData()
//        }
//
//
////        // ADD COURSES TO USERS
////        user1.addToCourses([course1, course2, course3])
////        user2.addToCourses(course1)
////
////        // SHOW USERS COURSES
////        if let user1Courses = user1.courses?.allObjects as? [Course] {
////            print("USER 1")
////            for course in user1Courses {
////                print("\(course.courseId) \(course.title!)")
////            }
////        }
////
////        if let user2Courses = user2.courses?.allObjects as? [Course] {
////            print("USER 2")
////            for course in user2Courses {
////                print("\(course.courseId) \(course.title!)")
////            }
////        }
//
////        //set progression on one of user 1 courses
////        let userCourse1 = UserCourse(context: context)
////        userCourse1.user = user1
////        userCourse1.course = course1
////        userCourse1.progression = 0.1
////
////        let userCourse2 = UserCourse(context: context)
////        userCourse2.user = user2
////        userCourse2.course = course1
////        userCourse2.progression = 0.2
////
////        getProgression(userId: user1.userId, courseId: course1.courseId)
////
////        for c in userCourse {
////            print("\(c.user?.name) \(c.course?.title) \(c.progression)")
////        }
//
//
//
//    }
//
//    func getCurrentUser() -> User {
//
//        var users: [User] = []
//        let request: NSFetchRequest<User> = User.fetchRequest()
//        let predicate = NSPredicate(format: "name == 'Marcus'")
//        request.predicate = predicate
//
//        do {
//            users = try context.fetch(request)
//        } catch {
//            print("Error fetching signed in user")
//        }
//
//        return users[0]
//    }
//
//    func createData(){
//
//        // CREATE USERS
//        let user1 = User(context: context)
//        user1.userId = 1
//        user1.name = "Marcus"
//        user1.age = 29
//
//        let user2 = User(context: context)
//        user2.userId = 2
//        user2.name = "Jonas"
//        user2.age = 25
//
//        // CREATE COURSES
//        let course1 = Course(context: context)
//        course1.courseId = 1001
//        course1.title = "How to hack pentagon"
//        course1.price = 1999
//
//        let course2 = Course(context: context)
//        course2.courseId = 1002
//        course2.title = "Sidewalks in the US"
//        course2.price = 299
//
//        let course3 = Course(context: context)
//        course3.courseId = 1003
//        course3.title = "Never forget about the color green"
//        course3.price = 499
//
//        user1.addToCourses([course1, course2, course3])
//
//        do{
//            try context.save()
//        } catch {
//            print("Could not save User!")
//        }
//
//    }
//
////    func getUserCourse(userId: Int64, courseId: Int64) -> UserCourse{
////        let request: NSFetchRequest<UserCourse> = UserCourse.fetchRequest()
////
////        let predicate = NSPredicate(format: "user.userId == %i AND course.courseId == %i", userId, courseId)
////        request.predicate = predicate
////
////        do {
////            userCourse = try context.fetch(request)
////        } catch {
////            print("Error fetching signed in user")
////        }
////        return userCourse[0]
////    }
//
//    func setProgression(user: User, course: Course, progression: Double){
//
////        let request: NSFetchRequest<UserCourse> = UserCourse.fetchRequest()
////        let predicate = NSPredicate(format: "user.userId == %i AND course.courseId == %i", user.userId, course.courseId)
////        request.predicate = predicate
////
////        do {
////            userCourse2 = try context.fetch(request)
////        } catch {
////            print("Error fetching UserCourse")
////        }
////
////        userCourse2[0].progression += progression
////
////        do{
////            try context.save()
////        } catch {
////            print("Could not save User!")
////        }
//
//
//        tableView.reloadData()
//
//    }
//
//    // FOR TESTING PURPOSE ONLY!!!
//    func deleteAllUsers() {
//        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "User")
//        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//
//        do {
//            try context.execute(deleteRequest)
//        } catch let error as NSError {
//            print("Could not delete all users \(error)")
//        }
//    }
//
//    // FOR TESTING PURPOSE ONLY!!!
//    func deleteAllCourses(){
//        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Course")
//        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//
//        do {
//            try context.execute(deleteRequest)
//        } catch let error as NSError {
//            print("Could not delete all courses \(error)")
//        }
//    }
//    // FOR TESTING PURPOSE ONLY!!!
//    func deleteAllUserCourse(){
//        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "UserCourse")
//        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//
//        do {
//            try context.execute(deleteRequest)
//        } catch let error as NSError {
//            print("Could not delete all courses \(error)")
//        }
//    }
//
//}
//
//extension ViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return userCourseArray.count
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CourseTableViewCell
//        let userCourse = userCourseArray[indexPath.row]
//
//        cell.titleLabel.text = userCourse.course?.title
//        cell.priceLabel.text = ("\(userCourse.course?.price) kr")
//        cell.progressionLabel.text = String(userCourse.progression)
//
//        return cell
//
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let userCourse = userCourseArray[indexPath.row]
//        userCourse.progression += 0.1
//
//        do{
//            try context.save()
//        } catch {
//            print("Could not save User!")
//        }
//
//        tableView.reloadData()
//        //setProgression(user: currentUser!, course: userCourse.course!, progression: 0.1)
//    }
//
//
//}
//
