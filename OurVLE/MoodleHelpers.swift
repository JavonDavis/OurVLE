//
//  ViewControllerExtensions.swift
//  OurVLE
//
//  Created by Javon Davis on 26/08/2016.
//  Copyright © 2016 Javon Davis. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration

protocol MoodleHelpers {
    
    // MARK: Moodle API Constants
    var SERVICE_MOODLE_MOBILE: String { get }
    var API_HOST: String { get }
    var RESPONSE_FORMAT: String { get }
    var LOGIN_URL: String { get }
    var WEB_SERVICE: String { get }
    
    var PARAM_USERNAME: String { get }
    var PARAM_PASSWORD: String { get }
    var PARAM_SERVICE: String { get }
    var PARAM_TOKEN: String { get }
    var PARAM_FUNCTION: String { get }
    var PARAM_FORMAT: String { get }
    var PARAM_USERID: String { get }
    var PARAM_COURSEID: String { get }
    
    
    // MARK: Moodle Functions
    var FUNCTION_GET_USER_COURSES: String { get }
    var FUNCTION_GET_COURSE_CONTENTS: String { get }
    var FUNCTION_GET_FORUMS: String { get }
    var FUNCTION_GET_DISCUSSIONS: String { get }
    var FUNCTION_GET_POSTS: String { get }
    var FUNCTION_GET_SITE_INFO: String { get }
    var FUNCTION_GET_USERS_FROM_COURSE: String { get }
    
    // Return default parameters
    func params() -> [String:String]
    
    // MARK: Connectivity Helpers
    var NO_INTERNET: String { get }
    var connectedToInternet: Bool { get }
    
    // MARK: Helper to show Alert
    func showAlert(message: String) -> UIAlertController
}

extension MoodleHelpers {
    
    // Define computed properties
    var SERVICE_MOODLE_MOBILE: String { return "moodle_mobile_app" }
    var API_HOST: String { return "http://ourvle.mona.uwi.edu/" }
    var RESPONSE_FORMAT: String { return "json" }
    var LOGIN_URL: String { return API_HOST + "login/token.php" }
    var WEB_SERVICE: String { return "http://ourvle.mona.uwi.edu/webservice/rest/server.php" }
    
    var PARAM_USERNAME: String { return "username" }
    var PARAM_PASSWORD: String { return "password" }
    var PARAM_SERVICE: String { return "service" }
    var PARAM_TOKEN: String { return "wstoken" }
    var PARAM_FUNCTION: String { return "wsfunction" }
    var PARAM_FORMAT: String { return "moodlewsrestformat" }
    var PARAM_USERID: String { return "userid" }
    var PARAM_COURSEID: String { return "courseid" }
    
    var FUNCTION_GET_USER_COURSES: String { return "moodle_enrol_get_users_courses" }
    var FUNCTION_GET_COURSE_CONTENTS: String { return "core_course_get_contents" }
    var FUNCTION_GET_FORUMS: String { return "mod_forum_get_forums_by_courses" }
    var FUNCTION_GET_DISCUSSIONS: String { return "mod_forum_get_forum_discussions" }
    var FUNCTION_GET_POSTS: String { return "mod_forum_get_forum_discussion_posts" }
    var FUNCTION_GET_SITE_INFO: String { return "moodle_webservice_get_siteinfo" }
    var FUNCTION_GET_USERS_FROM_COURSE: String { return "moodle_user_get_users_by_courseid" }
    
    func params() -> [String:String] {
        return [PARAM_TOKEN: token(), PARAM_FORMAT:RESPONSE_FORMAT]
    }
    
    var NO_INTERNET: String { return "No Internet connection available." }
    var connectedToInternet: Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(&zeroAddress, {
            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
        }) else {
            return false
        }
        
        var flags : SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.Reachable)
        let needsConnection = flags.contains(.ConnectionRequired)
        
        return (isReachable && !needsConnection)
    }
    
    func showAlert(message: String) -> UIAlertController {
        let alertController = UIAlertController(title: "App Error", message:
            message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        return alertController
    }
    
    // Token and Site Info Helpers(Getters and Setters)
    func token() -> String {
        return APIConstants.token
    }
    
    func token(value: String) {
        APIConstants.token = value
    }
    
    func siteInfo() -> SiteInfo {
        return APIConstants.siteInfo
    }
    
    func siteInfo(value: SiteInfo) {
        APIConstants.siteInfo = value
    }
}

struct APIConstants {
    static var token: String!
    static var siteInfo: SiteInfo!
}

extension String {
    
    var html2AttributedString: NSAttributedString? {
        guard
            let data = dataUsingEncoding(NSUTF8StringEncoding)
            else { return nil }
        do {
            return try NSAttributedString(data: data, options: [NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType,NSCharacterEncodingDocumentAttribute:NSUTF8StringEncoding], documentAttributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}