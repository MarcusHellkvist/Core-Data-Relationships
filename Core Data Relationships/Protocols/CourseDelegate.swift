//
//  CourseDelegate.swift
//  Core Data Relationships
//
//  Created by Marcus Hellkvist on 2021-03-11.
//

import Foundation

protocol CourseDelegate: class {
    func addToWishlist(course: Course)
    func addToBought(course: Course)
    func addToEnrolled(course: Course)
}
