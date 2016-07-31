//
//  UITextFieldExtension.swift
//  OurVLE
//
//  Created by Javon Davis on 31/07/2016.
//  Copyright © 2016 Javon Davis. All rights reserved.
//

import Foundation
import UIKit


extension UITextField
{
    func setBottomBorder(color:CGColor? = nil)
    {
        self.borderStyle = UITextBorderStyle.None;
        let border = CALayer()
        let width = CGFloat(1.0)
        if let color = color
        {
            border.borderColor = color
        }
        else{
            border.borderColor = UIColor.blackColor().CGColor
        }
        border.frame = CGRect(x: 0, y: self.frame.size.height - width,   width:  self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
}