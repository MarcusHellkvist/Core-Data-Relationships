//
//  DataManager.swift
//  Core Data Relationships
//
//  Created by Marcus Hellkvist on 2021-03-11.
//

import Foundation
import CoreData

class DataManager {
    static let shared = DataManager()
    var currentUserId: Int64!
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Core_Data_Relationships")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // FOR TESTING PURPOSE ONLY!!!
    func deleteAllUsers() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "User")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try persistentContainer.viewContext.execute(deleteRequest)
        } catch let error as NSError {
            print("Could not delete all users \(error)")
        }
    }
    
    // FOR TESTING PURPOSE ONLY!!!
    func deleteAllCourses(){
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Course")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try persistentContainer.viewContext.execute(deleteRequest)
        } catch let error as NSError {
            print("Could not delete all courses \(error)")
        }
    }
    
    func createUser(username: String, password: String, firstname: String, lastname: String, email: String, phone: Int64, userId: Int64){
        let user = User(context: persistentContainer.viewContext)
        user.username = username
        user.password = password
        user.firstname = firstname
        user.lastname = lastname
        user.email = email
        user.phone = phone
        user.userId = userId
        
    }
    
    func getUsers() -> [User] {
        let request: NSFetchRequest<User> = User.fetchRequest()
        var users: [User] = []
        
        do {
            users = try persistentContainer.viewContext.fetch(request)
        } catch {
            print("Error fetching users")
        }
        return users
    }
    
    func getCurrentUser() -> User {
        let request: NSFetchRequest<User> = User.fetchRequest()
        let predicate = NSPredicate(format: "userId == %i", currentUserId)
        request.predicate = predicate
        var currentUser: [User] = []
        
        do {
            currentUser = try persistentContainer.viewContext.fetch(request)
        } catch {
            print("Error fetching signed in user")
        }
        
        return currentUser[0]
    }
    
    func createCourse(id: Int64, title: String, desc: String, rating: Int64, length: Int64, teacher: String, category: Int64, price: Int64){
        let course = Course(context: persistentContainer.viewContext)
        course.courseId = id
        course.title = title
        course.desc = desc
        course.rating = rating
        course.length = length
        course.teacher = teacher
        course.category = category
        course.price = price
    }
    
    func getCourses() -> [Course] {
        let request: NSFetchRequest<Course> = Course.fetchRequest()
        var courses: [Course] = []
        
        do{
            courses = try persistentContainer.viewContext.fetch(request)
        } catch {
            print("Error fetching courses")
        }
        return courses
    }
    
    func createUserCourse(user: User, course: Course, status: Int64) -> Bool {
        
        // SE OM KURSEN REDAN ÄR REGISTERAD ELLER KÖPT
        let request: NSFetchRequest<UserCourse> = UserCourse.fetchRequest()
        let predicate = NSPredicate(format: "user.userId == %i AND course.courseId == %i", user.userId, course.courseId)
        request.predicate = predicate
        var courses: [UserCourse] = []

        do{
            courses = try persistentContainer.viewContext.fetch(request)
        } catch {
            print("Error fetching courses")
        }
        
        if courses.isEmpty {
            let userCourse = UserCourse(context: persistentContainer.viewContext)
            userCourse.user = user
            userCourse.course = course
            userCourse.progression = 0.0
            userCourse.status = status
            return true
        } else {
            switch status {
            case 1:
                updateUserCourseStatus(userCourse: courses[0], status: 1)
            case 2:
                updateUserCourseStatus(userCourse: courses[0], status: 2)
            default:
                updateUserCourseStatus(userCourse: courses[0], status: 0)
            }
        }
        
        return false
    }
    
    private func updateUserCourseStatus(userCourse: UserCourse, status: Int64) {
        userCourse.status = status
    }
    
    private func getActiveCourses(user: User) -> [UserCourse] {
        let request: NSFetchRequest<UserCourse> = UserCourse.fetchRequest()
        let predicate = NSPredicate(format: "user.userId == %i", user.userId)
        request.predicate = predicate
        var activeCourses: [UserCourse] = []

        do{
            activeCourses = try persistentContainer.viewContext.fetch(request)
        } catch {
            print("Error fetching courses")
        }

        return activeCourses
    }
    
    func getBoughtCourses(user: User) -> [UserCourse] {
        let request: NSFetchRequest<UserCourse> = UserCourse.fetchRequest()
        let predicate = NSPredicate(format: "user.userId == %i AND status == %i", user.userId, 1)
        request.predicate = predicate
        var boughtCourses: [UserCourse] = []
        
        do{
            boughtCourses = try persistentContainer.viewContext.fetch(request)
        } catch {
            print("Error fetching courses")
        }
        
        return boughtCourses
    }
    
    func getEnrolledCourses(user: User) -> [UserCourse] {
        let request: NSFetchRequest<UserCourse> = UserCourse.fetchRequest()
        let predicate = NSPredicate(format: "user.userId == %i AND status == %i", user.userId, 2)
        request.predicate = predicate
        var enrolledCourses: [UserCourse] = []
        
        do{
            enrolledCourses = try persistentContainer.viewContext.fetch(request)
        } catch {
            print("Error fetching courses")
        }
        
        return enrolledCourses
    }
    
}
