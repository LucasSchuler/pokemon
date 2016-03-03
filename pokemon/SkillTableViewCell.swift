//
//  SkillTableViewCell.swift
//  pokemon
//
//  Created by Lucas Fraga Schuler on 02/03/16.
//  Copyright © 2016 Lucas Fraga Schuler. All rights reserved.
//

import UIKit

class SkillTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var accuracy: UILabel!
    @IBOutlet weak var power: UILabel!
    @IBOutlet weak var powerpoint: UILabel!
    @IBOutlet weak var damage: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
