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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleCourseSections()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return courseSections.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let courseSection = courseSections[section]
        return courseSection.name
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let courseSection = courseSections[section]
        let courseModules = courseSection.modules
        
        return courseModules.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "ResourcesTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        let courseSection = courseSections[indexPath.section]
        let courseModules = courseSection.modules
        let courseModule = courseModules[indexPath.row]
        
        print("\(indexPath.section) - \(indexPath.row)")
        
        let moduleContent = courseModule.contents[0] // For OurVLE it's very rare for a module to have more than a single piece of content attached
        
        cell.textLabel?.text = courseModule.name
        cell.detailTextLabel?.text = "Uploaded by: \(moduleContent.author)"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let moduleSection = courseSections[indexPath.section]
        let courseModules = moduleSection.modules
        let module = courseModules[indexPath.row]
        
        print("\(module.name) clicked")
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    func loadSampleCourseSections()
    {
        // Sample Sections
        let section1 = CourseSection()
        section1.id = 1
        section1.name = "Section 1"
        
        let section2 = CourseSection()
        section2.id = 2
        section2.name = "Section 2"
        
        let section3 = CourseSection()
        section3.id = 3
        section3.name = "Section 3"
        
        let section4 = CourseSection()
        section4.id = 4
        section4.name = "Section 4"
        
        let section5 = CourseSection()
        section5.id = 5
        section5.name = "Section 5"
        
        // Sample Modules
        let module1 = CourseModule()
        module1.id = 1
        module1.name = "Module 1"
        
        let module2 = CourseModule()
        module2.id = 2
        module2.name = "Module 2"
        
        let module3 = CourseModule()
        module3.id = 3
        module3.name = "Module 3"
        
        let module4 = CourseModule()
        module4.id = 4
        module4.name = "Module 4"
        
        let module5 = CourseModule()
        module5.id = 5
        module5.name = "Module 5"
        
        let module6 = CourseModule()
        module6.id = 6
        module6.name = "Module 6"
        
        // Sample Module Contents
        let content1 = CourseModuleContent()
        content1.author = "Javon Davis1"
        let content2 = CourseModuleContent()
        content2.author = "Javon Davis2"
        let content3 = CourseModuleContent()
        content3.author = "Javon Davis3"
        let content4 = CourseModuleContent()
        content4.author = "Javon Davis4"
        let content5 = CourseModuleContent()
        content5.author = "Javon Davis5"
        let content6 = CourseModuleContent()
        content6.author = "Javon Davis6"
        
        module1.contents = [content1]
        module2.contents = [content2]
        module3.contents = [content3]
        module4.contents = [content4]
        module5.contents = [content5]
        module6.contents = [content6]
        
        section1.modules = [module1]
        section2.modules = [module2, module6]
        section3.modules = [module3]
        section4.modules = [module4]
        section5.modules = [module5]
        
        courseSections += [section1, section2, section3, section4, section5]
    }
}
