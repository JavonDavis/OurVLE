//
//  ProfileTableViewCell.swift
//  OurVLE
//
//  Created by Javon Davis on 04/08/2016.
//  Copyright © 2016 Javon Davis. All rights reserved.
//

import Foundation
import UIKit

class ProfileTableViewCell: UITableViewCell {

    // MARK: Properties
    
    @IBOutlet weak var profileItemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
