//
//  CourseViewController.swift
//  OurVLE
//
//  Created by Javon Davis on 03/08/2016.
//  Copyright © 2016 Javon Davis. All rights reserved.
//

import Foundation
import UIKit

class CourseViewController: UITableViewController {
    
    var courses = [Course]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        courses.removeAll()
        courses.appendContentsOf(getTestCourses())
    }
    
}