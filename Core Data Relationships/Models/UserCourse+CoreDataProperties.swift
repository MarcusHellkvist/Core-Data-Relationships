//
//  UserCourse+CoreDataProperties.swift
//  Core Data Relationships
//
//  Created by Marcus Hellkvist on 2021-03-14.
//
//

import Foundation
import CoreData


extension UserCourse {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserCourse> {
        return NSFetchRequest<UserCourse>(entityName: "UserCourse")
    }

    @NSManaged public var progression: Double
    @NSManaged public var status: Int64
    @NSManaged public var course: Course?
    @NSManaged public var user: User?

}

extension UserCourse : Identifiable {

}
