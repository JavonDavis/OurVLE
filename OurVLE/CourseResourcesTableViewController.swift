//
//  CourseContentTableViewController.swift
//  OurVLE
//
//  Created by Javon Davis on 15/08/2016.
//  Copyright © 2016 Javon Davis. All rights reserved.
//

import Foundation
import UIKit

class CourseResourcesTableViewController: UITableViewController {

    var courseSections = [CourseSection]()
    var courseModules = [CourseModule]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return courseSections.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let courseSection = courseSections[section]
        
        let filteredModules = courseModules.filter({ $0.sectionid == String(courseSection.id)})
        return filteredModules.count
    }
}
