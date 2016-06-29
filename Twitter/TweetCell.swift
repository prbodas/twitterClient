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
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //set textLabel values
        tweetText.numberOfLines = 0
        tweetText.text = "Hello"
        tweetText.backgroundColor = UIColor.whiteColor()
        tweetText.textColor = UIColor.blackColor()
        
        //add properties to superview
        self.addSubview(tweetText)
        
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
    
    func activateConstraints()
    {
        NSLayoutConstraint(item: tweetText, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .TopMargin, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: tweetText, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .BottomMargin, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: tweetText, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .LeftMargin, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint(item: tweetText, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .RightMargin, multiplier: 1.0, constant: 0.0).active = true
    }

}
