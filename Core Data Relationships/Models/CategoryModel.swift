//
//  CategoryModel.swift
//  Core Data Relationships
//
//  Created by Marcus Hellkvist on 2021-03-11.
//

import Foundation

struct CategoryModel {
    var name: String
    var courses: [Course] = [Course]()
}
