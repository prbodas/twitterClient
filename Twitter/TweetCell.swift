//
//  TweetCell.swift
//  Twitter
//
//  Created by Prachi Bodas on 6/28/16.
//  Copyright © 2016 Prachi Bodas. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    //var text = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        //set textLabel values
        //text?.numberOfLines = 0
        //text?. = "Hello"
        
        self.activateConstraints()
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func activateConstraints()
    {
        
    }

}
