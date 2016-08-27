//
//  DiscussionTableViewCell.swift
//  OurVLE
//
//  Created by Javon Davis on 26/08/2016.
//  Copyright © 2016 Javon Davis. All rights reserved.
//

import Foundation
import UIKit

class DiscussionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var discussionTitleLabel: UILabel!
    @IBOutlet weak var postCountLabel: UILabel!
    @IBOutlet weak var discussionDetailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
