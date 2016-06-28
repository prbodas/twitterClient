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
    
    static var colors = [UIColor.yellowColor(), UIColor.blackColor(), UIColor.blueColor()]
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
