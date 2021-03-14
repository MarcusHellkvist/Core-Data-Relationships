//
//  User+CoreDataProperties.swift
//  Core Data Relationships
//
//  Created by Marcus Hellkvist on 2021-03-14.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var firstname: String?
    @NSManaged public var lastname: String?
    @NSManaged public var password: String?
    @NSManaged public var phone: Int64
    @NSManaged public var userId: Int64
    @NSManaged public var username: String?
    @NSManaged public var userCourse: NSSet?
    @NSManaged public var wishlist: NSSet?

}

// MARK: Generated accessors for userCourse
extension User {

    @objc(addUserCourseObject:)
    @NSManaged public func addToUserCourse(_ value: UserCourse)

    @objc(removeUserCourseObject:)
    @NSManaged public func removeFromUserCourse(_ value: UserCourse)

    @objc(addUserCourse:)
    @NSManaged public func addToUserCourse(_ values: NSSet)

    @objc(removeUserCourse:)
    @NSManaged public func removeFromUserCourse(_ values: NSSet)

}

// MARK: Generated accessors for wishlist
extension User {

    @objc(addWishlistObject:)
    @NSManaged public func addToWishlist(_ value: Course)

    @objc(removeWishlistObject:)
    @NSManaged public func removeFromWishlist(_ value: Course)

    @objc(addWishlist:)
    @NSManaged public func addToWishlist(_ values: NSSet)

    @objc(removeWishlist:)
    @NSManaged public func removeFromWishlist(_ values: NSSet)

}

extension User : Identifiable {

}
