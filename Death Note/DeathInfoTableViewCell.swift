//
//  DeathInfoTableViewCell.swift
//  Death Note
//
//  Created by Anastasiia VEREMIICHYK on 10/4/18.
//  Copyright © 2018 Anastasiia VEREMIICHYK. All rights reserved.
//

import UIKit

class DeathInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var deathDescriptionLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    
    
    var info : (String, String, String)? {
        didSet {
            if let d = info {
                nameLabel?.text = d.0
                deathDescriptionLabel?.text = d.1
                dataLabel?.text = d.2
                nameLabel?.numberOfLines = 0
                deathDescriptionLabel?.numberOfLines = 0
                dataLabel?.numberOfLines = 0
                
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
