//
//  TwitterCall.swift
//  Twitter
//
//  Created by Prachi Bodas on 6/29/16.
//  Copyright © 2016 Prachi Bodas. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class TwitterCall: NSObject {
    static var client = BDBOAuth1SessionManager(baseURL: NSURL(string: "https://api.twitter.com")!, consumerKey: "P7JEB0pyp1EXlyVIOHPrcCaYl", consumerSecret: "K3XYKTTZ90Gv6yRNbiqoLDgNcwCgX7IXlnZusCN1EZ88TRdCcq")

}
