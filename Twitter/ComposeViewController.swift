//
//  ComposeViewController.swift
//  Twitter
//
//  Created by Prachi Bodas on 6/30/16.
//  Copyright © 2016 Prachi Bodas. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var tweetText = UITextView()
    var sendButton = UIButton()
    var sentNotif = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view properties
        view.backgroundColor = Style.colors["blue"]
        
        //sentNotif
        sentNotif.setTitle("Sent!", forState: .Normal)
        sentNotif.backgroundColor = Style.colors["green"]
        sentNotif.addTarget(self, action: #selector(ComposeViewController.handleTap), forControlEvents: UIControlEvents.TouchUpInside)
        sentNotif.hidden = true
        
        //tweetText
        tweetText.editable = true
        tweetText.backgroundColor = UIColor.whiteColor()
        
        //sendbutton
        sendButton.setTitle("Send", forState: .Normal)
        sendButton.backgroundColor = UIColor.blackColor()
        sendButton.addTarget(self, action: #selector(ComposeViewController.postStatus), forControlEvents: .TouchUpInside)
        
        //add to super
        view.addSubview(tweetText)
        view.addSubview(sendButton)
        view.addSubview(sentNotif)
        
        Style.autoViews(view)
        self.activateConstraints()
        
        //keyboard dismissal
        //let tap = UITapGestureRecognizer(target: self, action: #selector(ComposeViewController.handleTap))
        //tap.delegate = self
        //view.addGestureRecognizer(tap)
    }
    
    func handleTap()
    {
        sentNotif.hidden = true
    }
    
    func postStatus()
    {
        var message = tweetText.text
        message = message.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        
        let twitterClient = TwitterCall.client
        twitterClient.POST("1.1/statuses/update.json?status=\(message!)", parameters: nil , success: { (task: NSURLSessionDataTask, obj: AnyObject?) in
            print ("msg success")
            print(message)
            self.tweetText.text = ""
            self.sentNotif.hidden = false
            self.view.endEditing(true)
            
        }) { (task:NSURLSessionDataTask?, error:NSError) in
            print("msg failed")
            print(message)
            print (error.localizedDescription)
        }
    }
    
    func activateConstraints()
    {
        //tweetText
        NSLayoutConstraint(item: tweetText, attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .LeftMargin, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint(item: tweetText, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .RightMargin, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint(item: tweetText, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .TopMargin, multiplier: 1.0, constant: 100.0).active = true
        NSLayoutConstraint(item: tweetText, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 0.4, constant: 0.0).active = true
        
        //send button
        NSLayoutConstraint(item: sendButton, attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .LeftMargin, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint(item: sendButton, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .RightMargin, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint(item: sendButton, attribute: .Top, relatedBy: .Equal, toItem: tweetText, attribute: .Bottom, multiplier: 1.0, constant: 10.0).active = true
        NSLayoutConstraint(item: sendButton, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.1, constant: 10.0).active = true
        
        //sentNotif
        NSLayoutConstraint(item: sentNotif, attribute: .Left, relatedBy: .Equal, toItem: tweetText, attribute: .LeftMargin, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint(item: sentNotif, attribute: .Right, relatedBy: .Equal, toItem: tweetText, attribute: .RightMargin, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint(item: sentNotif, attribute: .Top, relatedBy: .Equal, toItem: tweetText, attribute: .TopMargin, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint(item: sentNotif, attribute: .Bottom, relatedBy: .Equal, toItem: tweetText, attribute: .Bottom, multiplier: 1.0, constant: 0.0).active = true
    }



}
