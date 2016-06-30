//
//  FeedViewController.swift
//  Twitter
//
//  Created by Prachi Bodas on 6/27/16.
//  Copyright © 2016 Prachi Bodas. All rights reserved.
//

import UIKit

class FeedViewController: ViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tweets:[Tweet] = []
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add subviews to main view
        view.addSubview(tableView)
        
        //auto layouts all children
        Style.autoViews(view)
        Style.autoViews(tableView)
        
        self.activateConstraints()

        //set table attributes
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        //self.tableView.setNeedsLayout()
        //self.tableView.layoutIfNeeded()
        //tableView.reloadData()
        
        let btn1 = UIButton()
        btn1.setTitle("Profile", forState: .Normal)
        btn1.setTitleColor(UIColor.blueColor(), forState: .Normal)
        btn1.frame = CGRectMake(0, 0, 100, 30)
        btn1.addTarget(self, action: Selector("toProfile"), forControlEvents: .TouchUpInside)
        let item1 = UIBarButtonItem()
        item1.customView = btn1
        
        let btn2 = UIButton()
        btn2.setTitle("Compose", forState: .Normal)
        btn2.setTitleColor(UIColor.blueColor(), forState: .Normal)
        btn2.frame = CGRectMake(0, 0, 100, 30)
        btn2.addTarget(self, action: Selector("toCompose"), forControlEvents: .TouchUpInside)
        let item2 = UIBarButtonItem()
        item2.customView = btn2
        
        
        self.navigationItem.leftBarButtonItems = [item1]
        self.navigationItem.rightBarButtonItems = [item2]
        
        //add refresh pull
        let refreshControl = UIRefreshControl()
         refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), forControlEvents: UIControlEvents.ValueChanged)
        tableView.insertSubview(refreshControl, atIndex: 0)
        
    }
    
    func refreshControlAction(refreshControl: UIRefreshControl) {
        
        // ... Create the NSURLRequest (myRequest) ...
        
        // Configure session so that completion handler is executed on main UI thread
        let twitterClient = TwitterCall.client
        twitterClient.GET("1.1/statuses/home_timeline.json", parameters: nil, progress: nil, success: { (task:NSURLSessionDataTask, response: AnyObject?) in
            let homeTimeline = response as! [NSDictionary]
            print (homeTimeline)
            var tweets:[Tweet] = []
            
            for dict in homeTimeline
            {
                tweets.append(Tweet.init(dictionary: dict))
            }
            
            self.tweets = tweets
            self.tableView.reloadData()
            refreshControl.endRefreshing()
            
            //let navctrl = UINavigationController(rootViewController: feed)
            
            //app.keyWindow?.rootViewController?.presentViewController(navctrl, animated: true, completion: {print("new presented")})
            
            
        }) { (task: NSURLSessionDataTask?, error: NSError) in
            print ("home timeline error")
        }
    }
    
    func toCompose()
    {
        let compose:ComposeViewController = ComposeViewController()
        self.navigationController?.pushViewController(compose, animated: true)
    }
    
    func toProfile()
    {
        let profile:ProfileViewController = ProfileViewController()
        let userobj = try! NSJSONSerialization.JSONObjectWithData(NSUserDefaults.standardUserDefaults().objectForKey("current_user") as! NSData, options: [])
        let currentuser = User.init(dictionary: userobj as! NSDictionary)
        profile.user = currentuser
        self.navigationController?.pushViewController(profile, animated: true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 19
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let newcell = TweetCell()
        newcell.setUpCell(tweets[indexPath.row], viewcon: self)
        //newcell.tweetText.text = tweets[indexPath.row].text
        return newcell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let details:DetailViewController = DetailViewController()
        details.tweet = tweets[indexPath.row]
        self.navigationController?.pushViewController(details, animated: true)
    }
    
    
    func activateConstraints()
    {
        
        //set tableView to same dimensions as parent view
        NSLayoutConstraint(item: tableView, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .BottomMargin, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: tableView, attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .LeftMargin, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: tableView, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .RightMargin, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: tableView, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .TopMargin, multiplier: 1.0, constant: 0.0).active = true
    }
    
    
    
    
}
