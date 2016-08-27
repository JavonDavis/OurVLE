//
//  ProfileViewController.swift
//  OurVLE
//
//  Created by Javon Davis on 03/08/2016.
//  Copyright © 2016 Javon Davis. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UITableViewController, MoodleHelpers {
    
    var profileItems = [ProfileItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadProfileItems()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        // Could section it by what group the user is in for a specific profileItem
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileItems.count
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        let profileItem = profileItems[indexPath.row]
        if profileItem.function != nil
        {
            return indexPath
        }
        else{
            return nil
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cellIdentifier = "ProfileTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ProfileTableViewCell
        
        let profileItem = profileItems[indexPath.row]
        
        cell.profileItemLabel.text = profileItem.label
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let profileItem = profileItems[indexPath.row]
        
        if let function = profileItem.function
        {
            function()
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    func loadProfileItems() {
        
        // TODO: Implement a proper profile page and make use of the user profile picture
        let profileItem = ProfileItem(itemLabel: siteInfo().fullname)
        let profileItem1 = ProfileItem(itemLabel: siteInfo().username)
        let profileItem2 = ProfileItem(itemLabel: "Log Out", functionToExecute: logOut)
        
        profileItems += [profileItem,profileItem1,profileItem2]
    }
    
    func loadSampleProfileItems() {
        
        let profileItem = ProfileItem(itemLabel: "Javon Davis")
        
        let profileItem1 = ProfileItem(itemLabel: "620068192")
        
        let profileItem2 = ProfileItem(itemLabel: "Log Out", functionToExecute: logOut)
        
        profileItems += [profileItem,profileItem1,profileItem2]
    }
    
    func logOut() {
        performSegueWithIdentifier("LogOut", sender: self)
    }
}


// Used to represent an item in the Profile table and any code to be executed when touched
struct ProfileItem {
    
    let label: String!
    let function: (() -> ())?
    
    init(itemLabel label:String) {
        self.init(itemLabel: label, functionToExecute: nil)
    }
    
    init(itemLabel label:String, functionToExecute function: (() -> ())?) {
        self.label = label
        self.function = function
    }
}