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
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let newcell = TweetCell()
        newcell.tweetText.text = tweets[indexPath.row].text
        return newcell
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
