//
//  ActiveCourseTableViewCell.swift
//  Core Data Relationships
//
//  Created by Marcus Hellkvist on 2021-03-11.
//

import UIKit

class ActiveCourseTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var teacherLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var progressLabel: UILabel!
    @IBOutlet var courseView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.textColor = UIColor.white
        teacherLabel.textColor = UIColor.white
        progressLabel.textColor = UIColor.white
        
        self.backgroundColor = UIColor.myBlue
        progressView.progressTintColor = UIColor.myYellow
        
        //Style cell
        courseView.layer.cornerRadius = 8
        courseView.layer.backgroundColor = UIColor.myLightBlue.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
