//
//  ViewController.swift
//  OurVLE
//
//  Created by Javon Davis on 30/07/2016.
//  Copyright © 2016 Javon Davis. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire
import ObjectMapper

class LoginViewController: UIViewController, Helpers {

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
        
        guard connectedToInternet else {
            self.presentViewController(self.showAlert(NO_INTERNET), animated: true, completion: nil)
            return
        }
        
        // > IOS 6 will return nil when empty and < IOS 7 will return ""
        guard let idNumber = idNumberField.text, password = passwordField.text where !idNumber.isEmpty && !password.isEmpty else {
            let message = "Please enter a username and a password."
            self.presentViewController(self.showAlert(message), animated: true, completion: nil)
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
        let params = [APIConstants.PARAM_USERNAME: idNumber, APIConstants.PARAM_PASSWORD: password, APIConstants.PARAM_SERVICE: APIConstants.SERVICE_MOODLE_MOBILE]
        Alamofire.request(.GET, APIConstants.LOGIN_URL, parameters: params).responseObject { (response: Response<Token, NSError>) in
            
            guard let token = response.result.value else {
                let message = "The app had an error trying to Log In. Please try again later"
                self.presentViewController(self.showAlert(message), animated: true, completion: nil)
                self.loginUnsuccessful()
                return
            }

            if let error = token.error {
                self.presentViewController(self.showAlert(error), animated: true, completion: nil)
                self.loginUnsuccessful()
            }
            else {
                print(token.token)
                self.loginSuccessful(token.token)
            }
            
        }

        
    }
    
}

