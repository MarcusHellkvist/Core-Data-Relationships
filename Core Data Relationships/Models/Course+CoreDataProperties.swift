//
//  Course+CoreDataProperties.swift
//  Core Data Relationships
//
//  Created by Marcus Hellkvist on 2021-03-12.
//
//

import Foundation
import CoreData


extension Course {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course")
    }

    @NSManaged public var category: Int64
    @NSManaged public var courseId: Int64
    @NSManaged public var desc: String?
    @NSManaged public var length: Int64
    @NSManaged public var price: Int64
    @NSManaged public var rating: Int64
    @NSManaged public var teacher: String?
    @NSManaged public var title: String?
    @NSManaged public var userCourse: NSSet?
    @NSManaged public var users: NSSet?

}

// MARK: Generated accessors for userCourse
extension Course {

    @objc(addUserCourseObject:)
    @NSManaged public func addToUserCourse(_ value: UserCourse)

    @objc(removeUserCourseObject:)
    @NSManaged public func removeFromUserCourse(_ value: UserCourse)

    @objc(addUserCourse:)
    @NSManaged public func addToUserCourse(_ values: NSSet)

    @objc(removeUserCourse:)
    @NSManaged public func removeFromUserCourse(_ values: NSSet)

}

// MARK: Generated accessors for users
extension Course {

    @objc(addUsersObject:)
    @NSManaged public func addToUsers(_ value: User)

    @objc(removeUsersObject:)
    @NSManaged public func removeFromUsers(_ value: User)

    @objc(addUsers:)
    @NSManaged public func addToUsers(_ values: NSSet)

    @objc(removeUsers:)
    @NSManaged public func removeFromUsers(_ values: NSSet)

}

extension Course : Identifiable {

}
