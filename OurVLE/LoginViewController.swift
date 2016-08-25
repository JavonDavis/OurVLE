//
//  ViewController.swift
//  OurVLE
//
//  Created by Javon Davis on 30/07/2016.
//  Copyright © 2016 Javon Davis. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var idNumberField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idNumberField.setBottomBorder()
        passwordField.setBottomBorder()
        
    }

    @IBAction func loginClick(sender: AnyObject) {
        
        // >IOS 6 will return nil when empty
        guard let idNumber = idNumberField.text, password = passwordField.text else
        {
            return
        }
        
        // < IOS 7 will return ""
        guard !idNumber.isEmpty && !password.isEmpty else
        {
            return
        }
        
        // show indicator and hide other UI elements
        loadingIndicator.startAnimating()
        _ = [loginButton, idNumberField, passwordField].map({ $0.hidden = true})
        
        // attempt to login
        validateCredentials(id: idNumber, password: password)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    func loginSuccessful(token: String) {
        
        APIConstants.token = token
        performSegueWithIdentifier("LogIn", sender: self)
    }
    
    func loginUnsuccessful() {
        // show message to user here
        loadingIndicator.stopAnimating()
        _ = [loginButton, idNumberField, passwordField].map({ $0.hidden = false})
    }
    
    func validateCredentials(id idNumber: String, password: String)
    {
        // send login request

        loginSuccessful("token")
    }
    
}

