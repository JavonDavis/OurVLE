//
//  WebViewController.swift
//  OurVLE
//
//  Created by Javon Davis on 27/08/2016.
//  Copyright © 2016 Javon Davis. All rights reserved.
//

import Foundation
import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var url:NSURL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = url {
            let requestObj = NSURLRequest(URL: url)
            webView.loadRequest(requestObj)
        }
    }
}