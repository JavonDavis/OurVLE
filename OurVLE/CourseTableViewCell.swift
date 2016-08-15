//
//  CourseTableViewCell.swift
//  OurVLE
//
//  Created by Javon Davis on 03/08/2016.
//  Copyright © 2016 Javon Davis. All rights reserved.
//

import Foundation
import UIKit

class CourseTableViewCell: UITableViewCell {

    // MARK: Properties
    
    @IBOutlet weak var courseTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
