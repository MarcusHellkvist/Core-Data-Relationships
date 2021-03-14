//
//  Lesson+CoreDataProperties.swift
//  Core Data Relationships
//
//  Created by Marcus Hellkvist on 2021-03-14.
//
//

import Foundation
import CoreData


extension Lesson {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Lesson> {
        return NSFetchRequest<Lesson>(entityName: "Lesson")
    }

    @NSManaged public var length: Int64
    @NSManaged public var title: String?
    @NSManaged public var course: Course?

}

extension Lesson : Identifiable {

}
