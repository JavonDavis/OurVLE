//
//  APIConstants.swift
//  OurVLE
//
//  Created by Javon Davis on 23/08/2016.
//  Copyright © 2016 Javon Davis. All rights reserved.
//

import Foundation

struct APIConstants {
    
    // MARK: Moodle API Constants
    static let SERVICE_MOODLE_MOBILE = "moodle_mobile_app"
    static let API_HOST = "http://ourvle.mona.uwi.edu/"
    static let RESPONSE_FORMAT = "json"
    static let LOGIN_URL = API_HOST + "login/token.php"
    static let WEB_SERVICE = "/webservice/rest/server.php"
    
    static let PARAM_USERNAME = "username"
    static let PARAM_PASSWORD = "password"
    static let PARAM_TOKEN = "wstoken"
    static let PARAM_FUNCTION = "wsfunction"
    static let PARAM_FORMAT = "moodlewsrestformat"
    
    
    // MARK: Moodle Functions
    static let FUNCTION_GET_USER_COURSES = "moodle_enrol_get_users_courses"
    static let FUNCTION_GET_COURSE_CONTENTS = "core_course_get_contents"
    static let FUNCTION_GET_FORUMS = "mod_forum_get_forums_by_courses"
    static let FUNCTION_GET_DISCUSSIONS = "mod_forum_get_forum_discussions"
    static let FUNCTION_GET_POSTS = "mod_forum_get_forum_discussion_posts"
    static let FUNCTION_GET_SITE_INFO = "moodle_webservice_get_siteinfo"
    static let FUNCTION_GET_USERS_FROM_COURSE = "moodle_user_get_users_by_courseid"
    
    static var token: String!
    
    static func params() -> [String:String] {
        return [PARAM_TOKEN:token, PARAM_FORMAT:RESPONSE_FORMAT]
    }
}