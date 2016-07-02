//
//  DetailViewController.swift
//  Twitter
//
//  Created by Prachi Bodas on 6/28/16.
//  Copyright © 2016 Prachi Bodas. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class DetailViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var tweet:Tweet = Tweet()
    
    var nameLabel = UILabel()
    var textLabel = UILabel()
    var userPicView = UIImageView()
    var retweetButton = UIButton()
    var replyButton = UIButton()
    var favoriteButton = UIButton()
    var replyTextView = UITextView()
    var sendButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view params
        view.backgroundColor = Style.colors["blue"]
        
        //add views to super
        view.addSubview(nameLabel)
        view.addSubview(textLabel)
        view.addSubview(userPicView)
        view.addSubview(retweetButton)
        view.addSubview(replyButton)
        view.addSubview(favoriteButton)
        view.addSubview(replyTextView)
        view.addSubview(sendButton)
        
        
        //nameLabel properties
        nameLabel.text = tweet.user.name
        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.textAlignment = NSTextAlignment.Center
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.backgroundColor = UIColor.clearColor()
        
        //textLabel properties
        textLabel.numberOfLines = 0
        textLabel.text = tweet.text
        textLabel.backgroundColor = UIColor.clearColor()
        
        //userPicView properties
        userPicView.setImageWithURL(NSURL(string: tweet.user.pictureurl)!)
        
        //retweetButton properties
        retweetButton.backgroundColor = UIColor.clearColor()
        retweetButton.setBackgroundImage(UIImage(named: "retweet"), forState: .Normal)
        retweetButton.addTarget(self, action: #selector(DetailViewController.onRetweet), forControlEvents: UIControlEvents.TouchUpInside)
        
        //replyButton properties
        replyButton.backgroundColor = UIColor.clearColor()
        replyButton.setBackgroundImage(UIImage(named: "reply"), forState: .Normal)
        replyButton.addTarget(self, action: #selector(DetailViewController.onReply), forControlEvents: UIControlEvents.TouchUpInside)
        
        //favoriteButton properites
        favoriteButton.backgroundColor = UIColor.clearColor()
        favoriteButton.setBackgroundImage(UIImage(named: "favorite"), forState: .Normal)
        favoriteButton.addTarget(self, action: #selector(DetailViewController.onFavorite), forControlEvents: UIControlEvents.TouchUpInside)
        
        //replyTextField properties
        replyTextView.hidden = true
        replyTextView.text = "Reply here"
        
        //sendButton properties
        sendButton.backgroundColor = UIColor.blackColor()
        sendButton.setTitle("Send", forState: UIControlState.Normal)
        sendButton.hidden = true
        sendButton.addTarget(self, action: #selector(DetailViewController.onSendText), forControlEvents: UIControlEvents.TouchUpInside)
        
        let tap = UITapGestureRecognizer(target: self, action: Selector("handleTap"))
        tap.delegate = self
        view.addGestureRecognizer(tap)

        
        Style.autoViews(view)
        self.activateConstraints()
    }

    func onRetweet()
    {
        print("retweeted")
        let twitterClient = BDBOAuth1SessionManager(baseURL: NSURL(string: "https://api.twitter.com")!, consumerKey: "P7JEB0pyp1EXlyVIOHPrcCaYl", consumerSecret: "K3XYKTTZ90Gv6yRNbiqoLDgNcwCgX7IXlnZusCN1EZ88TRdCcq")
        twitterClient.POST("1.1/statuses/retweet/\(tweet.id).json", parameters: nil , success: { (task: NSURLSessionDataTask, obj: AnyObject?) in
               print ("retweet success")
        }) { (task:NSURLSessionDataTask?, error:NSError) in
                print("retweet failed")
                print (error.localizedDescription)
        }
    }
    
    func onFavorite()
    {
        print("favorited")
        let twitterClient = TwitterCall.client
        twitterClient.POST("1.1/favorites/create.json?id=\(tweet.id)", parameters: nil , success: { (task: NSURLSessionDataTask, obj: AnyObject?) in
            print ("fave success")
        }) { (task:NSURLSessionDataTask?, error:NSError) in
            print("fave failed")
            print (error.localizedDescription)
        }

    }
    
    func onReply()
    {
        print("replied")
        replyTextView.hidden = false
        sendButton.hidden = false
    

    }
    
    func handleTap()
    {
        view.endEditing(true)
    }
    
    func onSendText()
    {
        var message = replyTextView.text
        
        message = message.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        
        print(message)
        
        let twitterClient = TwitterCall.client
        twitterClient.POST("1.1/statuses/update.json?status=\(message!)&in_reply_to_status_id=\(tweet.id)", parameters: nil , success: { (task: NSURLSessionDataTask, obj: AnyObject?) in
            print ("msg success")
            print(message)
            self.replyTextView.hidden = true
            self.sendButton.hidden = true
            self.view.endEditing(true)
        }) { (task:NSURLSessionDataTask?, error:NSError) in
            print("msg failed")
            print(message)
            print (error.localizedDescription)
        }
    }

    
    func activateConstraints()
    {
        //name constraints
        NSLayoutConstraint(item: nameLabel, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .TopMargin, multiplier: 1.0, constant: 60.0).active = true
        
        NSLayoutConstraint(item: nameLabel, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: nameLabel, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: nameLabel, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.1, constant: 0.0).active = true
        
        //replyTextView constraints
        
        NSLayoutConstraint(item: replyTextView, attribute: .Top, relatedBy: .Equal, toItem:nameLabel , attribute: .Bottom, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: replyTextView, attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .LeftMargin, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: replyTextView, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.8, constant: 0.0).active = true
        
        NSLayoutConstraint(item: replyTextView, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.0, constant: 30.0).active = true
        
        //sendButton constraints
        
        NSLayoutConstraint(item: sendButton, attribute: .Top, relatedBy: .Equal, toItem:nameLabel , attribute: .Bottom, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: sendButton, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .RightMargin, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: sendButton, attribute: .Left, relatedBy: .Equal, toItem: replyTextView, attribute: .Right, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: sendButton, attribute: .Bottom, relatedBy: .Equal, toItem: replyTextView, attribute: .Bottom, multiplier: 1.0, constant: 0.0).active = true

        
        //tweet text constraints
        
        NSLayoutConstraint(item: textLabel, attribute: .Top, relatedBy: .Equal, toItem: replyTextView, attribute: .Bottom, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: textLabel, attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .LeftMargin, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: textLabel, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .RightMargin, multiplier: 1.0, constant: 0.0).active = true
        
        //favorite button constraints
        
        NSLayoutConstraint(item: favoriteButton, attribute: .Top, relatedBy: .Equal, toItem: textLabel, attribute: .Bottom, multiplier: 1.0, constant: 10.0).active = true
        
        NSLayoutConstraint(item: favoriteButton, attribute: .Width, relatedBy: .Equal, toItem: textLabel, attribute: .Width, multiplier: 0.1, constant: 0.0).active = true
        
        NSLayoutConstraint(item: favoriteButton, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: favoriteButton, attribute: .Height, relatedBy: .Equal, toItem: favoriteButton, attribute: .Width, multiplier: 1.0, constant: 0.0).active = true
        
        //retweet button constraints
        
        NSLayoutConstraint(item: retweetButton, attribute: .Top, relatedBy: .Equal, toItem: textLabel, attribute: .Bottom, multiplier: 1.0, constant: 10.0).active = true
        
        NSLayoutConstraint(item: retweetButton, attribute: .Width, relatedBy: .Equal, toItem: textLabel, attribute: .Width, multiplier: 0.1, constant: 0.0).active = true
        
        NSLayoutConstraint(item: retweetButton, attribute: .Height, relatedBy: .Equal, toItem: favoriteButton, attribute: .Width, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: retweetButton, attribute: .Right, relatedBy: .Equal, toItem: favoriteButton, attribute: .Left, multiplier: 1.0, constant: -10.0).active = true
        
        //reply button constraints
        
        NSLayoutConstraint(item: replyButton, attribute: .Top, relatedBy: .Equal, toItem: textLabel, attribute: .Bottom, multiplier: 1.0, constant: 10.0).active = true
        
        NSLayoutConstraint(item: replyButton, attribute: .Width, relatedBy: .Equal, toItem: textLabel, attribute: .Width, multiplier: 0.1, constant: 0.0).active = true
        
        NSLayoutConstraint(item: replyButton, attribute: .Height, relatedBy: .Equal, toItem: favoriteButton, attribute: .Width, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: replyButton, attribute: .Left, relatedBy: .Equal, toItem: favoriteButton, attribute: .Right, multiplier: 1.0, constant: 10.0).active = true
        
        
        
    }

}
