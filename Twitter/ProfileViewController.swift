//
//  ProfileViewController.swift
//  Twitter
//
//  Created by Prachi Bodas on 6/29/16.
//  Copyright © 2016 Prachi Bodas. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var user:User = User()
    
    var profilePic = UIImageView()
    var username = UILabel()
    var tagline = UILabel()
    var userStats = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //profilePic attributes
        profilePic.setImageWithURL(NSURL(string: user.pictureurl)!)
        
        //username 
        username.text = user.name
        username.textAlignment = .Center
        username.backgroundColor = UIColor.whiteColor()
        
        //tagline
        tagline.text = user.tagline
        tagline.backgroundColor = UIColor.orangeColor()
        tagline.textAlignment = .Center
        
        //stats
        userStats.numberOfLines = 0
        userStats.text = " #Following: \(user.numFollowing) \n #Followers: \(user.numFollowers) \n #Tweets: \(user.numTweets)"
        userStats.backgroundColor = UIColor.cyanColor()
        userStats.textAlignment = .Center
        
        //add subviews
        view.addSubview(profilePic)
        view.addSubview(username)
        view.addSubview(tagline)
        view.addSubview(userStats)
        
        Style.autoViews(view)
        
        self.activateConstraints()
        
    }
    
    func activateConstraints()
    {
        //profilePic
        NSLayoutConstraint(item: profilePic, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint(item: profilePic, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.1, constant: 0.0).active = true
        NSLayoutConstraint(item: profilePic, attribute: .Width, relatedBy: .Equal, toItem: profilePic, attribute: .Height, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint(item: profilePic, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .TopMargin, multiplier: 1.0, constant: 60.0).active = true
        
        //username
        NSLayoutConstraint(item: username, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint(item: username, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.2, constant: 0.0).active = true
        NSLayoutConstraint(item: username, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint(item: username, attribute: .Top, relatedBy: .Equal, toItem: profilePic, attribute: .Bottom, multiplier: 1.0, constant: 10.0).active = true
        
        //tagline
        NSLayoutConstraint(item: tagline, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint(item: tagline, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint(item: tagline, attribute: .Top, relatedBy: .Equal, toItem: username, attribute: .Bottom, multiplier: 1.0, constant: 10.0).active = true
        
        //user stats
        NSLayoutConstraint(item: userStats, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint(item: userStats, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint(item: userStats, attribute: .Top, relatedBy: .Equal, toItem: tagline, attribute: .Bottom, multiplier: 1.0, constant: 10.0).active = true
        
    }

}
