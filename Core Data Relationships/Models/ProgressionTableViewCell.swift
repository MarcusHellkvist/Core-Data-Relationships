//
//  ProgressionTableViewCell.swift
//  Core Data Relationships
//
//  Created by Marcus Hellkvist on 2021-03-14.
//

import UIKit

class ProgressionTableViewCell: UITableViewCell {

    @IBOutlet var lessonTitleLabel: UILabel!
    @IBOutlet var lessonLengthLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        lessonTitleLabel.textColor = UIColor.white
        lessonLengthLabel.textColor = UIColor.white
        self.backgroundColor = UIColor.myBlue
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
