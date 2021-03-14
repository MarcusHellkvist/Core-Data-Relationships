//
//  RatingModel.swift
//  Core Data Relationships
//
//  Created by Marcus Hellkvist on 2021-03-13.
//

import Foundation
import UIKit

struct RatingModel {

    static func getRatingImage(number: Int64) -> UIImage {
        var ratingImage = UIImage()
        switch number {
        case 1:
            ratingImage = UIImage(named: "star1")!
        case 2:
            ratingImage = UIImage(named: "star2")!
        case 3:
            ratingImage = UIImage(named: "star3")!
        case 4:
            ratingImage = UIImage(named: "star4")!
        case 5:
            ratingImage = UIImage(named: "star5")!
        default:
            ratingImage = UIImage(named: "star5")!
        }
        return ratingImage
    }
}
