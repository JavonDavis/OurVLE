//
//  ViewController.swift
//  OurVLE
//
//  Created by Javon Davis on 30/07/2016.
//  Copyright © 2016 Javon Davis. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var idNumberField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        idNumberField.setBottomBorder()
        passwordField.setBottomBorder()
        
    }

    @IBAction func loginClick(sender: AnyObject) {
        
        print("Log In Clicked")
        performSegueWithIdentifier("LogIn", sender: self)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
}

