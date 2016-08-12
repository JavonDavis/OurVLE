//
//  HomeTabBarController.swift
//  OurVLE
//
//  Created by Javon Davis on 11/08/2016.
//  Copyright © 2016 Javon Davis. All rights reserved.
//

import Foundation
import UIKit

class HomeTabBarController: UITabBarController {

    
    @IBAction func logOut(sender: AnyObject) {
        
        print("Log Out Clicked")
        performSegueWithIdentifier("logOut", sender: self)
    }
}
