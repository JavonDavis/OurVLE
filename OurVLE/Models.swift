//
//  Models.swift
//  OurVLE
//
//  Created by Javon Davis on 04/08/2016.
//  Copyright © 2016 Javon Davis. All rights reserved.
//

import Foundation
import ObjectMapper
// Would use structs instead of class but data needs to be persisted as NSData


// MARK: SiteInfo
class SiteInfo: NSObject, NSCoding, Mappable {
    var sitename: String!
    var username: String!
    var firstname: String!
    var lastname: String!
    var fullname: String!
    var siteurl: String!
    var userpictureurl: String!
    var token: String!
    
    var userid: Int!
    
    override init()
    {
        // initialise vars here
    }
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        sitename <- map["sitename"]
        username <- map["username"]
        firstname <- map["firstname"]
        lastname <- map["lastname"]
        fullname <- map["fullname"]
        siteurl <- map["siteurl"]
        userpictureurl <- map["userpictureurl"]
        token <- map["token"]
        userid <- map["userid"]
    }
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        
        self.sitename = decoder.decodeObjectForKey("sitename") as! String
        self.username = decoder.decodeObjectForKey("username") as! String
        self.firstname = decoder.decodeObjectForKey("firstname") as! String
        self.lastname = decoder.decodeObjectForKey("lastname") as! String
        self.fullname = decoder.decodeObjectForKey("fullname") as! String
        self.siteurl = decoder.decodeObjectForKey("siteurl") as! String
        self.userpictureurl = decoder.decodeObjectForKey("userpictureurl") as! String
        self.token = decoder.decodeObjectForKey("token") as! String
        self.userid = decoder.decodeObjectForKey("userid") as! Int
        
    }
    
    func encodeWithCoder(coder: NSCoder) {
        if let sitename = sitename { coder.encodeObject(sitename, forKey: "sitename") }
        if let username = username { coder.encodeObject(username, forKey: "username") }
        if let firstname = firstname { coder.encodeObject(firstname, forKey: "firstname") }
        if let lastname = lastname { coder.encodeObject(lastname, forKey: "lastname") }
        if let fullname = fullname { coder.encodeObject(fullname, forKey: "fullname") }
        if let siteurl = siteurl { coder.encodeObject(siteurl, forKey: "siteurl") }
        if let userpictureurl = userpictureurl { coder.encodeObject(userpictureurl, forKey: "userpictureurl") }
        if let token = token { coder.encodeObject(token, forKey: "token") }
        if let userid = userid { coder.encodeObject(userid, forKey: "userid") }
        
    }
}

class Token: NSObject, NSCoding, Mappable {
    var token: String!
    var error: String!
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        
        self.token = decoder.decodeObjectForKey("token") as! String
        self.error = decoder.decodeObjectForKey("error") as! String
        
    }
    
    convenience override init() {
        self.init()
    }
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        token <- map["token"]
        error <- map["error"]
    }
    
    func encodeWithCoder(coder: NSCoder) {
        if let token = token { coder.encodeObject(token, forKey: "token") }
        if let error = error { coder.encodeObject(error, forKey: "error") }
        
    }
}

// MARK: Course
class Course: NSObject, NSCoding, Mappable {
    // Fields
    
    var id: Int!
    
    var shortname: String!
    var fullname: String!
    var summary: String!
    
    override init() {
       // initialise vars here
    }
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        
        shortname <- map["shortname"]
        fullname <- map["fullname"]
        summary <- map["summary"]
    }
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        
        self.shortname = decoder.decodeObjectForKey("shortname") as! String
        self.fullname = decoder.decodeObjectForKey("fullname") as! String
        self.summary = decoder.decodeObjectForKey("summary") as! String
        
        self.id = decoder.decodeObjectForKey("id") as! Int
        
    }
    
    func encodeWithCoder(coder: NSCoder) {
        if let shortname = shortname { coder.encodeObject(shortname, forKey: "shortname") }
        if let fullname = fullname { coder.encodeObject(fullname, forKey: "fullname") }
        if let summary = summary { coder.encodeObject(summary, forKey: "summary") }
        
        if let id = id { coder.encodeObject(id, forKey: "id") }
        
    }
}

class Forum: NSObject, NSCoding, Mappable {
    
    var id: Int!
    
    var course: String!
    var name: String!
    var intro: String!
    
    override init() {
        // initialise vars here
    }
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        
        course <- map["course"]
        name <- map["name"]
        intro <- map["intro"]
    }
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        
        self.course = decoder.decodeObjectForKey("course") as! String
        self.name = decoder.decodeObjectForKey("name") as! String
        self.intro = decoder.decodeObjectForKey("intro") as! String
        
        self.id = decoder.decodeObjectForKey("id") as! Int
    }
    
    func encodeWithCoder(coder: NSCoder) {
        if let course = course { coder.encodeObject(course, forKey: "course") }
        if let name = name { coder.encodeObject(name, forKey: "fullname") }
        if let intro = intro { coder.encodeObject(intro, forKey: "intro") }
        
        if let id = id { coder.encodeObject(id, forKey: "id") }
        
    }
}

class ForumDiscussion: NSObject, NSCoding, Mappable {
    
    var id: Int!
    var name: String!
    var timemodified: Int!
    var firstuserfullname: String!
    var firstuseremail: String!
    var subject: String!
    var numreplies: String!
    
    override init() {
        // initialise vars here
    }
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        
        name <- map["name"]
        timemodified <- map["timemodified"]
        firstuserfullname <- map["firstuserfullname"]
        firstuseremail <- map["firstuseremail"]
        subject <- map["subject"]
        numreplies <- map["numreplies"]
    }
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        
        self.id = decoder.decodeObjectForKey("id") as! Int
        
        self.name = decoder.decodeObjectForKey("name") as! String
        self.timemodified = decoder.decodeObjectForKey("timemodified") as! Int
        self.firstuserfullname = decoder.decodeObjectForKey("firstuserfullname") as! String
        self.firstuseremail = decoder.decodeObjectForKey("firstuseremail") as! String
        self.subject = decoder.decodeObjectForKey("subject") as! String
        self.numreplies = decoder.decodeObjectForKey("numreplies") as! String
        
    }
    
    func encodeWithCoder(coder: NSCoder) {
       
        if let id = id { coder.encodeObject(id, forKey: "id") }
        
        if let name = name { coder.encodeObject(name, forKey: "name") }
        if let timemodified = timemodified { coder.encodeObject(timemodified, forKey: "timemodified") }
        if let firstuserfullname = firstuserfullname { coder.encodeObject(firstuserfullname, forKey: "firstuserfullname") }
        if let firstuseremail = firstuseremail { coder.encodeObject(firstuseremail, forKey: "firstuseremail") }
        if let subject = subject { coder.encodeObject(subject, forKey: "subject") }
        if let numreplies = numreplies { coder.encodeObject(numreplies, forKey: "numreplies") }
    }
}

class DiscussionPost: NSObject, NSCoding, Mappable {
    
    var id: Int!
    
    var created: Int!
    var modified: Int!
    var subject: String!
    var message: String!
    var messageformat: Int! // 1 = HTML, 0 = MOODLE, 2 = PLAIN or 4 = MARKDOWN
    var userfullname: String! // Full name of Author
    
    override init() {
        // initialise vars here
    }
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        
        userfullname <- map["userfullname"]
        created <- map["created"]
        modified <- map["modified"]
        subject <- map["subject"]
        message <- map["message"]
        messageformat <- map["messageformat"]
        
    }
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        
        self.id = decoder.decodeObjectForKey("id") as! Int
        
        self.userfullname = decoder.decodeObjectForKey("userfullname") as! String
        self.created = decoder.decodeObjectForKey("created") as! Int
        self.modified = decoder.decodeObjectForKey("modified") as! Int
        self.subject = decoder.decodeObjectForKey("subject") as! String
        self.message = decoder.decodeObjectForKey("message") as! String
        self.messageformat = decoder.decodeObjectForKey("messageformat") as! Int
        
        
    }
    
    func encodeWithCoder(coder: NSCoder) {
        
        if let id = id { coder.encodeObject(id, forKey: "id") }
        
        if let userfullname = userfullname { coder.encodeObject(userfullname, forKey: "userfullname") }
        if let created = created { coder.encodeObject(created, forKey: "created") }
        if let modified = modified { coder.encodeObject(modified, forKey: "modified") }
        if let subject = subject { coder.encodeObject(subject, forKey: "subject") }
        if let message = message { coder.encodeObject(message, forKey: "message") }
        if let messageformat = messageformat { coder.encodeObject(messageformat, forKey: "messageformat") }
        
    }
}

class CourseSection: NSObject, NSCoding, Mappable {
    
    var id: Int!
    
    var name: String!
    var summary: String!
    var modules: [CourseModule]!
    
    override init() {
        // initialise vars
    }
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        
        name <- map["name"]
        summary <- map["summary"]
        modules <- map["modules"]
    }
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        
        self.name = decoder.decodeObjectForKey("name") as! String
        self.summary = decoder.decodeObjectForKey("summary") as! String
        
        self.id = decoder.decodeObjectForKey("id") as! Int
        self.modules = decoder.decodeObjectForKey("modules") as! [CourseModule]
        
    }
    
    func encodeWithCoder(coder: NSCoder) {
        if let name = name { coder.encodeObject(name, forKey: "fullname") }
        if let summary = summary { coder.encodeObject(summary, forKey: "summary") }
        
        if let id = id { coder.encodeObject(id, forKey: "id") }
        if let modules = modules { coder.encodeObject(modules, forKey: "modules") }
        
    }
    
}

class CourseModule: NSObject, NSCoding, Mappable {
    
    var id: Int!
    
    var name: String!
    var url: String!
    var moduleDescription: String!
    var modname: String!
    var sectionid: String!
    var contents: [CourseModuleContent]!
    
    override init() {
        // initialise vars
    }
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        
        name <- map["name"]
        url <- map["url"]
        moduleDescription <- map["description"]
        modname <- map["modname"]
        sectionid <- map["sectionid"]
        contents <- map["contents"]
    }
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        
        self.name = decoder.decodeObjectForKey("name") as! String
        self.url = decoder.decodeObjectForKey("url") as! String
        self.moduleDescription = decoder.decodeObjectForKey("moduleDescription") as! String
        self.modname = decoder.decodeObjectForKey("modname") as! String
        self.sectionid = decoder.decodeObjectForKey("sectionid") as! String
        self.id = decoder.decodeObjectForKey("id") as! Int
        self.contents = decoder.decodeObjectForKey("contents") as! [CourseModuleContent]
    }
    
    func encodeWithCoder(coder: NSCoder) {
        if let name = name { coder.encodeObject(name, forKey: "fullname") }
        if let url = url { coder.encodeObject(url, forKey: "url") }
        if let moduleDescription = moduleDescription { coder.encodeObject(moduleDescription, forKey: "moduleDescription") }
        if let modname = modname { coder.encodeObject(modname, forKey: "modname") }
        if let sectionid = sectionid { coder.encodeObject(sectionid, forKey: "sectionid") }
        
        if let id = id { coder.encodeObject(id, forKey: "id") }
        if let contents = contents { coder.encodeObject(contents, forKey: "contents") }
    }
}

class CourseModuleContent: NSObject, NSCoding, Mappable {
    var type: String!
    var filename: String!
    var filesize: Int!
    var fileurl: String!
    var content: String!
    var timecreated: Int!
    var timemodified: Int!
    var userid: Int!
    var author: String!
    
    override init() {
        // initialise vars
    }
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        type <- map["type"]
        filename <- map["filename"]
        filesize <- map["filesize"]
        fileurl <- map["fileurl"]
        content <- map["content"]
        timecreated <- map["timecreated"]
        timemodified <- map["timemodified"]
        userid <- map["userid"]
        author <- map["author"]
    }
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        
        self.type = decoder.decodeObjectForKey("type") as! String
        self.filename = decoder.decodeObjectForKey("filename") as! String
        self.filesize = decoder.decodeObjectForKey("filesize") as! Int
        self.fileurl = decoder.decodeObjectForKey("fileurl") as! String
        self.content = decoder.decodeObjectForKey("content") as! String
        self.timecreated = decoder.decodeObjectForKey("timecreated") as! Int
        self.timemodified = decoder.decodeObjectForKey("timemodified") as! Int
        self.userid = decoder.decodeObjectForKey("userid") as! Int
        self.author = decoder.decodeObjectForKey("author") as! String
        
    }
    
    func encodeWithCoder(coder: NSCoder) {
        if let type = type { coder.encodeObject(type, forKey: "type") }
        if let filename = filename { coder.encodeObject(filename, forKey: "filename") }
        if let filesize = filesize { coder.encodeObject(filesize, forKey: "filesize") }
        if let fileurl = fileurl { coder.encodeObject(fileurl, forKey: "fileurl") }
        if let content = content { coder.encodeObject(content, forKey: "content") }
        
        if let timecreated = timecreated { coder.encodeObject(timecreated, forKey: "timecreated") }
        if let timemodified = timemodified { coder.encodeObject(timemodified, forKey: "timemodified") }
        if let userid = userid { coder.encodeObject(userid, forKey: "userid") }
        
        if let author = author { coder.encodeObject(author, forKey: "author") }
    }
}

