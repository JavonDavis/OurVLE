//
//  Models.swift
//  OurVLE
//
//  Created by Javon Davis on 04/08/2016.
//  Copyright © 2016 Javon Davis. All rights reserved.
//

import Foundation

// Using Structs since values will never be modified and not expected to be copied


// MARK: Moodle API Constants
let SERVICE_MOODLE_MOBILE = "moodle_mobile_app"
let API_HOST = "http://ourvle.mona.uwi.edu/"
let RESPONSE_FORMAT = "json"
let LOGIN_URL = API_HOST + "login/token.php"


// MARK: Moodle Functions
let FUNCTION_GET_USER_COURSES = "moodle_enrol_get_users_courses"
let FUNCTION_GET_COURSE_CONTENTS = "core_course_get_contents"
let FUNCTION_GET_FORUMS = "mod_forum_get_forums_by_courses"
let FUNCTION_GET_DISCUSSIONS = "mod_forum_get_forum_discussions"
let FUNCTION_GET_POSTS = "mod_forum_get_forum_discussion_posts"
let FUNCTION_GET_SITE_INFO = "moodle_webservice_get_siteinfo"
let FUNCTION_GET_USERS_FROM_COURSE = "moodle_user_get_users_by_courseid"


// MARK: SiteInfo
struct SiteInfo {
    var sitename: String?
    var username: String?
    var firstname: String?
    var lastname: String?
    var fullname: String?
    var siteurl: String?
    var userpictureurl: String?
    var token: String?
    
    var userid: Int?
}

// MARK: Token
struct Token {
    var token: String?
}

// MARK: Course
struct Course {
    // Fields
    
    var id: Int?
    
    var shortname: String?
    var fullname: String?
    var summary: String?
}