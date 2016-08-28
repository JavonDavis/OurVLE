//
//  DiscussionPost.swift
//  OurVLE
//
//  Created by Javon Davis on 17/08/2016.
//  Copyright © 2016 Javon Davis. All rights reserved.
//

import Foundation
import UIKit
import AlamofireObjectMapper
import Alamofire
import ObjectMapper

class DiscussionPostTableViewController: UITableViewController, MoodleHelpers {
    var posts = [DiscussionPost]()
    var discussion: ForumDiscussion!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl?.addTarget(self, action: #selector(DiscussionPostTableViewController.refresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        self.refreshControl?.beginRefreshing()
        loadPosts()
        
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
        
        if post.messageformat == 0 || post.messageformat == 1  {
           cell.postContentLabel.text = post.message.html2String
        }
        else {
            cell.postContentLabel.text = post.message
        }
        
        return cell
    }

    func refresh(sender:AnyObject)
    {
        guard connectedToInternet else {
            self.presentViewController(self.showAlert(NO_INTERNET), animated: true, completion: nil)
            self.refreshControl?.endRefreshing()
            return
        }
        
        loadPosts()
    }
    
    func loadPosts() {
        var params = self.params()
        params[self.PARAM_FUNCTION] = self.FUNCTION_GET_POSTS
        params["discussionid"] = String(discussion.id)
        
        Alamofire.request(.GET, self.WEB_SERVICE, parameters: params).responseArray(keyPath: "posts") { (response: Response<[DiscussionPost], NSError>) in
            
            guard let DiscussionPostArray = response.result.value else {
                let message = "Error loading Posts"
                self.presentViewController(self.showAlert(message), animated: true, completion: nil)
                self.refreshControl?.endRefreshing()
                return
            }
            
            self.posts.removeAll()
            self.posts.appendContentsOf(DiscussionPostArray)
            
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
    }
    
    func loadSamplePosts()
    {
        let post = DiscussionPost()
        post.userfullname = "Javon Davis"
        post.message = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
        
        posts += [post,post,post,post,post]
    }
}
