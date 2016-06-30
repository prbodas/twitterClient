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
        "beige": UIColor.init(red: 0xFF, green: 0xF5, blue: 0xC3, alpha: 1.0),
        "orange": UIColor.init(red: 0xEB, green: 0x6E, blue: 0x44, alpha: 1.0),
        "blue": UIColor.init(red: 0x8D, green: 0xCD, blue: 0xC1, alpha: 1.0),
        "green": UIColor.init(red: 0xD3, green: 0xE3, blue: 0x97, alpha: 1.0),
        "grey": UIColor.init(red: 0x7C, green: 0x78, blue: 0x6A, alpha: 1.0)]
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
