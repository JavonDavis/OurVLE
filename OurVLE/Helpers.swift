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

protocol Helpers {
    var NO_INTERNET: String { get }
    var connectedToInternet: Bool { get }
    func showAlert(message: String) -> UIAlertController
}

extension Helpers {
    
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
}