//
//  ForumDiscussionTableViewController.swift
//  OurVLE
//
//  Created by Javon Davis on 15/08/2016.
//  Copyright © 2016 Javon Davis. All rights reserved.
//

import Foundation
import UIKit

class ForumDiscussionTableViewController: UITableViewController {
    
    var discussions = [ForumDiscussion]()
    var forum: Forum!
    var discussion: ForumDiscussion!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl?.addTarget(self, action: #selector(CourseViewController.refresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        loadSampleDiscussions()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return discussions.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "ForumDiscussions"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        let discussion = discussions[indexPath.row]
        
        let numreplies = Int(discussion.numreplies)! + 1
    
        
        if numreplies == 1 {
            cell.textLabel?.text = discussion.subject + "(1 post)"
        }
        else {
            cell.textLabel?.text = discussion.subject + "(\(numreplies) posts)"
        }
        
        cell.detailTextLabel?.text = "Started By \(discussion.firstuserfullname)"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        discussion = discussions[indexPath.row]
        
        print("selected: \(discussion.subject)")
        
        performSegueWithIdentifier("DiscussionPosts", sender: self)
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DiscussionPosts" {
            let vc = segue.destinationViewController as! DiscussionPostTableViewController
            vc.discussion = discussion
        }
    }
    
    func refresh(sender:AnyObject)
    {
        // Updating your data here...
        let discussion = ForumDiscussion()
        discussion.id = 0
        discussion.subject = "Grades2"
        discussion.firstuserfullname = "Javon Davis2"
        discussion.numreplies = "2"
        
        discussions.append(discussion)
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    func loadSampleDiscussions() {
        
        let discussion = ForumDiscussion()
        discussion.id = 0
        discussion.subject = "Grades"
        discussion.firstuserfullname = "Javon Davis"
        discussion.numreplies = "0"
        
        let discussion1 = ForumDiscussion()
        discussion1.id = 1
        discussion1.subject = "Important"
        discussion1.firstuserfullname = "Busby"
        discussion1.numreplies = "4"
        
        let discussion2 = ForumDiscussion()
        discussion2.id = 2
        discussion2.subject = "Exams"
        discussion2.firstuserfullname = "Ferguson"
        discussion2.numreplies = "156"
        
        let discussion3 = ForumDiscussion()
        discussion3.id = 3
        discussion3.subject = "Meeting"
        discussion3.firstuserfullname = "Bruce"
        discussion3.numreplies = "10"
        
        let discussion4 = ForumDiscussion()
        discussion4.id = 4
        discussion4.subject = "Assignments"
        discussion4.firstuserfullname = "Javon Davis"
        discussion4.numreplies = "0"
        
        discussions += [discussion, discussion1, discussion2, discussion3, discussion4]
    }
}
