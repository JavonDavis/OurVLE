//
//  ForumViewController.swift
//  OurVLE
//
//  Created by Javon Davis on 03/08/2016.
//  Copyright © 2016 Javon Davis. All rights reserved.
//

import Foundation
import UIKit

class ForumViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var forums = [Forum]()
    var courses = [Course]()
    var selectedForum:Forum!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadSampleCourses()
        loadSampleForums()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return courses.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return courses[section].shortname
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let course = courses[section]
        let courseForums = forums.filter({ Int($0.course) == course.id })
        return courseForums.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cellIdentifier = "ForumTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ForumTableViewCell
        
        let course = courses[indexPath.section]
        let courseForums = forums.filter({ Int($0.course) == course.id })
        let forum = courseForums[indexPath.row]
        
        cell.forumTitleLabel.text = forum.name
        cell.forumIntroLabel.text = forum.intro
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let course = courses[indexPath.section]
        let courseForums = forums.filter({ Int($0.course) == course.id })
        selectedForum = courseForums[indexPath.row]
        
        print("Selected : \(selectedForum.name)")
        
        performSegueWithIdentifier("Discussions", sender: self)
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
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