//
//  CustomCell.swift
//  pokemon
//
//  Created by Lucas Fraga Schuler on 29/02/16.
//  Copyright © 2016 Lucas Fraga Schuler. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type1: UILabel!
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var type2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
