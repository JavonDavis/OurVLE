//
//  DiscussionPost.swift
//  OurVLE
//
//  Created by Javon Davis on 17/08/2016.
//  Copyright © 2016 Javon Davis. All rights reserved.
//

import Foundation
import UIKit

class DiscussionPostTableViewController: UITableViewController {
    var posts = [DiscussionPost]()
    var discussion: ForumDiscussion!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl?.addTarget(self, action: #selector(CourseViewController.refresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        loadSamplePosts()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "DiscussionPostTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! DiscussionPostTableViewCell
        
        let post = posts[indexPath.row]
        
        cell.postAuthorLabel.text = post.userfullname
        cell.postContentLabel.text = post.message
        
        return cell
    }

    func refresh(sender:AnyObject)
    {
        // Updating your data here...
        let post = DiscussionPost()
        post.userfullname = "Javon Davis2"
        post.message = "Good Day All!"
        
        posts.append(post)
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    func loadSamplePosts()
    {
        let post = DiscussionPost()
        post.userfullname = "Javon Davis"
        post.message = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
        
        posts += [post,post,post,post,post]
    }
}
