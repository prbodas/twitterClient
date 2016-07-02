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
    var user:User!
    var viewcontroller = FeedViewController()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //set self values
        self.backgroundColor = Style.colors["blue"]
        
        //set textLabel values
        tweetText.numberOfLines = 0
        tweetText.text = "Hello"
        tweetText.backgroundColor = UIColor.clearColor()
        tweetText.textColor = UIColor.blackColor()
        tweetText.font = Style.regFont
        
        //set username values
        username.text = "Hello"
        username.backgroundColor = UIColor.clearColor()
        username.textColor = UIColor.whiteColor()
        username.font = Style.boldFont
        //print("blue = \(Style.colors["blue"].)")
        
        //set timestamp values
        timeLabel.text = "hell"
        timeLabel.backgroundColor = UIColor.clearColor()
        timeLabel.textColor = UIColor.grayColor()
        
        //set userPicture values
        userPicture.backgroundColor = UIColor.clearColor()
        userPicture.userInteractionEnabled = true
        let newTap = UITapGestureRecognizer(target: self, action: #selector(TweetCell.toProfile))
        userPicture.addGestureRecognizer(newTap)
        
        //add properties to superview
        self.addSubview(tweetText)
        self.addSubview(userPicture)
        self.addSubview(username)
        self.addSubview(timeLabel)
        //self.addSubview(toProfileButton)
        
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
    
    func toProfile()
    {
        print("toprofile")
        let profile = ProfileViewController()
        profile.user = user
        viewcontroller.navigationController?.pushViewController(profile, animated: true)

    }
    
    func convertToDate(string: String) -> NSDate
    {
        let dateFor = NSDateFormatter()
        dateFor.dateFormat = "E MMM d HH:mm:ss Z yyyy"
        let nsDate = dateFor.dateFromString(string)
        return nsDate!
    }
    
    func convertDateToRelStr (date: NSDate) -> String
    {
        let dateFor = NSDateFormatter()
        var str = ""
        let interval = -1*(date.timeIntervalSinceNow as! Double)
        if (interval>(24.0*60.0*60.0))
        {
            let days = interval/(24.0*60.0*60.0)
            str = String(format: "%.0f days ago", days)
            //str = "\(days) days ago"
        }else if (interval > (60.0*60.0))
        {
            let hours = interval/(60.0*60.0)
            str = String(format: "%.0f hours ago", hours)
            //str = "\(hours) hours ago"
        }else if (interval > (60.0))
        {
            let minutes = interval/60.0
            str = String(format: "%.0f minutes ago", minutes)
            //str = "\(minutes) minutes ago"
        }else{
            let seconds = interval
            str = String(format: "%.0f seconds ago", seconds)
            //str = "\(seconds) seconds ago"
        }
        return str
    }
    
    
    func setUpCell(tweet:Tweet, viewcon:FeedViewController)
    {
        tweetText.text = tweet.text
        timeLabel.text = self.convertDateToRelStr(self.convertToDate(tweet.timestamp))
        //print("time = \(time)")
        username.text = tweet.user.name
        userPicture.setImageWithURL(NSURL(string: tweet.user.pictureurl)!)
        user = tweet.user
        viewcontroller = viewcon
    }
    
    
    func activateConstraints()
    {
        
        //username constraints
        NSLayoutConstraint(item: username, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .TopMargin, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: username, attribute: .Bottom, relatedBy: .Equal, toItem: tweetText, attribute: .Top, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: username, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .RightMargin, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: username, attribute: .Width, relatedBy: .Equal, toItem: tweetText, attribute: .Width, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: username, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0.0, constant: 40.0).active = true

        
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
