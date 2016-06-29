//
//  Tweet.swift
//  Twitter
//
//  Created by Prachi Bodas on 6/28/16.
//  Copyright © 2016 Prachi Bodas. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    
    var text = ""
    var timestamp = ""
    var user:User = User()
    
    override init()
    {
        super.init()
    }
    
    init(dictionary:NSDictionary)
    {
        super.init()
        text = dictionary["text"] as! String
        print(dictionary["user"])

        user = User(dictionary: dictionary["user"] as! NSDictionary)
        timestamp = dictionary["created_at"] as! String
    }
    
}
