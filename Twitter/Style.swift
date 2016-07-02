//
//  Style.swift
//  Twitter
//
//  Created by Prachi Bodas on 6/27/16.
//  Copyright © 2016 Prachi Bodas. All rights reserved.
//

import UIKit

class Style: NSObject {
    
    //makes style sheet for app
    
    //UIColor.init(red: 0xFF, green: 0xF5, blue: 0xC3, alpha: 1.0)
    //static var
    
    static var colors:[String:UIColor] = [
        "beige": UIColor.init(red: 0xFF/0xFF, green: 0xF5/0xFF, blue: 0xC3/0xFF, alpha: 1.0),
        "orange": UIColor.init(red: 0xEB/0xFF, green: 0x6E/0xFF, blue: 0x44/0xFF, alpha: 1.0),
        "blue": UIColor.init(red: 0x55/0xFF, green: 0xAC/0xFF, blue: 0xEE/0xFF, alpha: 1.0),
        "green": UIColor.init(red: 0xD3/0xFF, green: 0xE3/0xFF, blue: 0x97/0xFF, alpha: 1.0),
        "grey": UIColor.init(red: 0x7C/0xFF, green: 0x78/0xFF, blue: 0x6A/0xFF, alpha: 1.0)]
    
    static var regFontHeader:UIFont = UIFont(name: "Palatino-Roman", size: 20.0)!
    static var regFont:UIFont = UIFont(name: "Palatino-Roman", size: 15.0)!
    static var boldFont:UIFont = UIFont(name: "Palatino-Bold", size: 20.0)!
    //[UIColor.init(red: 0xFF, green: 0xF5, blue: 0xC3, alpha: 1.0) //beige
      //  , UIColor.blackColor(), UIColor.blueColor()]
    static var font = 4
    
    //enables all the subviews of the parent to be resized by constraints
    class func autoViews(parent:UIView)
    {
        let views = parent.subviews
        for v in views
        {
            v.translatesAutoresizingMaskIntoConstraints = false

        }

    }
    

}
