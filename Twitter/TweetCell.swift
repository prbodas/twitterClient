//
//  TweetCell.swift
//  Twitter
//
//  Created by Prachi Bodas on 6/28/16.
//  Copyright © 2016 Prachi Bodas. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    var tweetText = UILabel()
    var userPicture = UIImageView()
    var username = UILabel()
    var timeLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //set textLabel values
        tweetText.numberOfLines = 0
        tweetText.text = "Hello"
        tweetText.backgroundColor = UIColor.redColor()
        tweetText.textColor = UIColor.blackColor()
        
        //set username values
        username.text = "Hello"
        username.backgroundColor = UIColor.greenColor()
        
        //set timestamp values
        timeLabel.text = "hell"
        timeLabel.backgroundColor = UIColor.yellowColor()
        
        //set userPicture values
        userPicture.backgroundColor = UIColor.brownColor()
        
        //add properties to superview
        self.addSubview(tweetText)
        self.addSubview(userPicture)
        self.addSubview(username)
        self.addSubview(timeLabel)
        
        Style.autoViews(self)
        
        self.activateConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(tweet:Tweet)
    {
        tweetText.text = tweet.text
        timeLabel.text = tweet.timestamp
        username.text = tweet.user.name
        userPicture.setImageWithURL(NSURL(string: tweet.user.pictureurl)!)
    }
    
    
    func activateConstraints()
    {
        
        //username constraints
        NSLayoutConstraint(item: username, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .TopMargin, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: username, attribute: .Bottom, relatedBy: .Equal, toItem: tweetText, attribute: .Top, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: username, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .RightMargin, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: username, attribute: .Width, relatedBy: .Equal, toItem: tweetText, attribute: .Width, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: username, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0.25, constant: 0.0).active = true

        
        //tweetText constraints
        NSLayoutConstraint(item: tweetText, attribute: .Top, relatedBy: .Equal, toItem: username, attribute: .Bottom, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: tweetText, attribute: .Bottom, relatedBy: .Equal, toItem: timeLabel, attribute: .Top, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: tweetText, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Width, multiplier: 0.7, constant: 0.0).active = true
        
        NSLayoutConstraint(item: tweetText, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .RightMargin, multiplier: 1.0, constant: 0.0).active = true
        
        
        //timestamp constraints
        
        NSLayoutConstraint(item: timeLabel, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .BottomMargin, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: timeLabel, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0.15, constant: 0.0).active = true
        
        NSLayoutConstraint(item: timeLabel, attribute: .Width, relatedBy: .Equal, toItem: tweetText, attribute: .Width, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: timeLabel, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .RightMargin, multiplier: 1.0, constant: 0.0).active = true
        
        //userPicture constraints
        
        NSLayoutConstraint(item: userPicture, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .LeftMargin, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: userPicture, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: userPicture, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Width, multiplier: 0.15, constant: 0.0).active = true
        
        NSLayoutConstraint(item: userPicture, attribute: .Height, relatedBy: .Equal, toItem: userPicture, attribute: .Width, multiplier: 1.0, constant: 0.0).active = true
        
    }

}
