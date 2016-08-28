//
//  ForumViewController.swift
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

class ForumViewController: UITableViewController, MoodleHelpers {
    
    var forums = [Forum]()
    var courses = [Course]()
    var selectedForum:Forum!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl?.addTarget(self, action: #selector(ForumViewController.refresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        self.refreshControl?.beginRefreshing()
        loadForums()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return courses.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return courses[section].shortname
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let course = courses[section]
        let courseForums = forums.filter({ Int($0.course) == course.id })
        return courseForums.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cellIdentifier = "ForumTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ForumTableViewCell
        
        let course = courses[indexPath.section]
        let courseForums = forums.filter({ Int($0.course) == course.id })
        let forum = courseForums[indexPath.row]
        
        cell.forumTitleLabel.text = forum.name
        
        if forum.introformat == 1 || forum.introformat == 0 { // HTML format
            cell.forumIntroLabel.text = forum.intro.html2String
        }
        else {
            cell.forumIntroLabel.text = forum.intro
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        guard !(self.refreshControl?.refreshing)! else {
            tableView.deselectRowAtIndexPath(indexPath, animated: false)
            return
        }
        let course = courses[indexPath.section]
        let courseForums = forums.filter({ Int($0.course) == course.id })
        selectedForum = courseForums[indexPath.row]
        
        print("Selected : \(selectedForum.name)")
        
        performSegueWithIdentifier("Discussions", sender: self)
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Discussions" {
            let vc = segue.destinationViewController as! ForumDiscussionTableViewController
            vc.forum = selectedForum
        }
    }
    
    func refresh(sender:AnyObject)
    {
        // Updating your data here...
        guard connectedToInternet else {
            self.presentViewController(self.showAlert(NO_INTERNET), animated: true, completion: nil)
            self.refreshControl?.endRefreshing()
            return
        }
        
        loadForums()
    }
    
    func loadForums() {
        var params = self.params()
        params[self.PARAM_FUNCTION] = self.FUNCTION_GET_USER_COURSES
        params[self.PARAM_USERID] = String(self.siteInfo().userid)
        Alamofire.request(.GET, self.WEB_SERVICE, parameters: params).responseArray { (response: Response<[Course], NSError>) in
            
            guard let courseArray = response.result.value else {
                let message = "Error loading Courses for Forums"
                self.presentViewController(self.showAlert(message), animated: true, completion: nil)
                self.refreshControl?.endRefreshing()
                return
            }
            
            print(courseArray.count)
            self.courses.removeAll()
            self.forums.removeAll()
            self.courses.appendContentsOf(courseArray)
            
            var ids = courseArray.map({ $0.id })
            
            params = self.params()
            params[self.PARAM_FUNCTION] = self.FUNCTION_GET_FORUMS
            
            for index in 0...ids.count-1 {
                params["courseids[\(index)]"] = "\(ids[index])"
            }
            
            Alamofire.request(.GET, self.WEB_SERVICE, parameters: params).responseArray { (response: Response<[Forum], NSError>) in
                
                print(response.result.value)
                
                guard let forumArray = response.result.value else {
                    let message = "Error loading Forums"
                    self.presentViewController(self.showAlert(message), animated: true, completion: nil)
                    self.refreshControl?.endRefreshing()
                    return
                }
                
                self.forums.appendContentsOf(forumArray)
                
                self.tableView.reloadData()
                self.refreshControl?.endRefreshing()
            }
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
    
    func loadSampleForums()
    {
        let forum = Forum()
        forum.name = "News forum"
        forum.id = 1
        forum.course = "1"
        forum.intro = "General News and Announcements"
        
        let forum1 = Forum()
        forum1.name = "Discussion forum"
        forum1.id = 2
        forum1.course = "2"
        forum1.intro = "open forum for course 2\n\nIn this forum you're free to talk about anything"
        
        let forum2 = Forum()
        forum2.name = "Open Discussion forum"
        forum2.id = 3
        forum2.course = "3"
        forum2.intro = "open forum for course 3"
        
        let forum3 = Forum()
        forum3.name = "Private News Forum"
        forum3.id = 4
        forum3.course = "4"
        forum3.intro = "open forum for course 4"
        
        let forum4 = Forum()
        forum4.name = "Open News Forum"
        forum4.id = 5
        forum4.course = "5"
        forum4.intro = "open forum for course 5"
        
        let forum5 = Forum()
        forum5.name = "Closed News Forum"
        forum5.id = 6
        forum5.course = "2"
        forum5.intro = "closed forum for course 2"
        
        forums += [forum,forum1,forum2,forum3,forum4,forum5]
    }
}