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
    var selectedCourse:Course!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleCourses()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        // Could section it by what group the user is in for a specific course
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cellIdentifier = "CourseTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CourseTableViewCell
        
        let course = courses[indexPath.row]
        
        cell.courseTitleLabel.text = course.shortname + " - " + course.fullname
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selectedCourse = courses[indexPath.row]
        
        performSegueWithIdentifier("Course", sender: self)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "Course")
        {
            let vc = segue.destinationViewController as! CourseTabBarController
            vc.course = selectedCourse
        }
    }
    
    func loadSampleCourses()
    {
        let course = Course()
        course.shortname = "MATH1141"
        course.id = 1
        course.fullname = "Introduction to Linear Algebra"
        course.summary = "Course will introduce you to the fundamentals of linear algebra"
        
        let course1 = Course()
        course1.shortname = "MATH1142"
        course1.id = 2
        course1.fullname = "Calculus I"
        course1.summary = "Course will introduce you to the fundamentals of Calculus I"
        
        let course2 = Course()
        course2.shortname = "MATH1151"
        course2.id = 3
        course2.fullname = "Formal Mathematics"
        course2.summary = "Course will introduce you to the fundamentals of Formal Mathematics"
        
        let course3 = Course()
        course3.shortname = "MATH1152"
        course3.id = 4
        course3.fullname = "Calculus II"
        course3.summary = "Course will introduce you to the fundamentals of Calculus II"
        
        let course4 = Course()
        course4.shortname = "COMP1161"
        course4.id = 5
        course4.fullname = "Introduction to Object Oriented Programming"
        course4.summary = "Course will introduce you to the fundamentals of 'Object Oriented Programming'"
      
        courses += [course,course1,course2,course3,course4]
    }
}