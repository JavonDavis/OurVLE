//
//  CourseViewController.swift
//  OurVLE
//
//  Created by Javon Davis on 03/08/2016.
//  Copyright © 2016 Javon Davis. All rights reserved.
//

import Foundation
import UIKit
import AlamofireObjectMapper
import Alamofire
import ObjectMapper

class CourseViewController: UITableViewController, MoodleHelpers {
    
    var courses = [Course]()
    var selectedCourse:Course!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl?.addTarget(self, action: #selector(CourseViewController.refresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl?.beginRefreshing()
        loadCourses()
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
        guard !(self.refreshControl?.refreshing)! else {
            tableView.deselectRowAtIndexPath(indexPath, animated: false)
            return
        }
        
        selectedCourse = courses[indexPath.row]
        
        performSegueWithIdentifier("Resources", sender: self)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "Resources")
        {
            let vc = segue.destinationViewController as! CourseResourcesTableViewController
            vc.course = selectedCourse
        }
    }
    
    func refresh(sender:AnyObject)
    {
        guard connectedToInternet else {
            self.presentViewController(self.showAlert(NO_INTERNET), animated: true, completion: nil)
            self.refreshControl?.endRefreshing()
            return
        }
        
        courses.removeAll()
        loadCourses()
    }
    
    func loadCourses()
    {
        var params = self.params()
        params[self.PARAM_FUNCTION] = self.FUNCTION_GET_USER_COURSES
        params[self.PARAM_USERID] = String(self.siteInfo().userid)
        Alamofire.request(.GET, self.WEB_SERVICE, parameters: params).responseArray { (response: Response<[Course], NSError>) in
            
            guard let courseArray = response.result.value else {
                let message = "Error loading Courses"
                self.presentViewController(self.showAlert(message), animated: true, completion: nil)
                self.refreshControl?.endRefreshing()
                return
            }
            
            print(courseArray.count)
            self.courses.appendContentsOf(courseArray)
            
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
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
        self.refreshControl?.endRefreshing()
    }
}