//
//  ProgressionTableViewCell.swift
//  Core Data Relationships
//
//  Created by Marcus Hellkvist on 2021-03-14.
//

import UIKit

protocol MyCellDelegate: class {
    func didTapButtonInCell(_ cell: ProgressionTableViewCell)
}

class ProgressionTableViewCell: UITableViewCell {

    @IBOutlet var lessonTitleLabel: UILabel!
    @IBOutlet var lessonLengthLabel: UILabel!
    @IBOutlet var cellButton: UIButton!
    
    weak var delegate: MyCellDelegate?
    
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
    
    @IBAction func cellButtonTapped(_ sender: UIButton) {
        delegate?.didTapButtonInCell(self)
    }
    

}
