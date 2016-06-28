//
//  FeedViewController.swift
//  Twitter
//
//  Created by Prachi Bodas on 6/27/16.
//  Copyright © 2016 Prachi Bodas. All rights reserved.
//

import UIKit

class FeedViewController: ViewController, UITableViewDelegate {
    
    var tweets:[Tweet] = []
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        //set table attributes
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //add subviews to main view
        view.addSubview(tableView)
        
        //auto layouts all children
        Style.autoViews(view)
        
        self.activateConstraints()
    }
    
    func activateConstraints()
    {
        
        //set tableView to same dimensions as parent view
        NSLayoutConstraint(item: tableView, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: tableView, attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .Left, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: tableView, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: tableView, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 1.0, constant: 0.0).active = true
    }
    
    
    
    
}
