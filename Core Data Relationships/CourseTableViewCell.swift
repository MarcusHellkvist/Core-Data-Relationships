//
//  CourseTableViewCell.swift
//  Core Data Relationships
//
//  Created by Marcus Hellkvist on 2021-03-10.
//

import UIKit

class CourseTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var teacherLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var courseView: UIView!
    @IBOutlet var ratingImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.textColor = UIColor.white
        teacherLabel.textColor = UIColor.white
        priceLabel.textColor = UIColor.white
        
        self.backgroundColor = UIColor.myBlue
        
        //Style cell
        courseView.layer.cornerRadius = 8
        courseView.layer.backgroundColor = UIColor.myLightBlue.cgColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
