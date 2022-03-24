//
//  UnlockedAchievementTableViewCell.swift
//  Zenith
//
//  Created by Alex173 on 22.03.2022.
//

import UIKit

class UnlockedAchievementTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var achievementLabel: UILabel!
    @IBOutlet weak var achievementDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
