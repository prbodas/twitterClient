//
//  User.swift
//  Twitter
//
//  Created by Prachi Bodas on 6/28/16.
//  Copyright © 2016 Prachi Bodas. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var name = ""
    var pictureurl = ""
    var tagline = ""
    var numTweets = 0
    var numFollowing = 0
    var numFollowers = 0

    override init()
    {
        super.init()
    }
    
    init(dictionary:NSDictionary)
    {
        print ("INITDIC")
        print(dictionary)
        name = dictionary.valueForKey("screen_name") as! String
        pictureurl = dictionary.valueForKey("profile_image_url") as! String
        tagline = dictionary.valueForKey("description") as! String
        numTweets = dictionary.valueForKey("statuses_count") as! Int
        numFollowers = dictionary.valueForKey("followers_count") as! Int
        numFollowing = dictionary.valueForKey("friends_count") as! Int
    }

}
