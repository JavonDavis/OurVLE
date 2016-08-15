//
//  ForumViewController.swift
//  OurVLE
//
//  Created by Javon Davis on 03/08/2016.
//  Copyright © 2016 Javon Davis. All rights reserved.
//

import Foundation
import UIKit

class ForumViewController: UITableViewController {
    
    var forums = [Forum]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleForums()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forums.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cellIdentifier = "ForumTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ForumTableViewCell
        
        let forum = forums[indexPath.row]
        let course = getCourse(Int(forum.course))
        
        cell.forumTitleLabel.text = course.shortname + " - " + forum.name
        cell.forumIntroLabel.text = forum.intro
        
        return cell
    }
    
    func getCourse(id: Int!) -> Course {
        let course = Course()
        course.shortname = "MATH 1142"
        return course
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
        
        forums += [forum,forum1,forum2,forum3,forum4]
    }
}