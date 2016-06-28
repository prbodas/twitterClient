//
//  LoginViewController.swift
//  Twitter
//
//  Created by Prachi Bodas on 6/27/16.
//  Copyright © 2016 Prachi Bodas. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class LoginViewController: ViewController {
    
    let logoDisplay = UILabel()
    let userField = UITextField()
    let passField = UITextField()
    let loginButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add views to parent
        view.addSubview(logoDisplay)
        view.addSubview(userField)
        view.addSubview(passField)
        view.addSubview(loginButton)
        
        //set parent properties
        view.backgroundColor = UIColor.whiteColor() //TO BE REPLACED BY STYLE SHEET
        
        //logoDisplay properties
        logoDisplay.backgroundColor = UIColor.yellowColor()
        logoDisplay.text = "Twitter"
        logoDisplay.textAlignment = NSTextAlignment.Center
        
        //userField properties
        userField.backgroundColor = UIColor.blueColor()
        
        //passField properties
        passField.backgroundColor = UIColor.redColor()
        
        //loginButton properties
        loginButton.backgroundColor = UIColor.greenColor()
        loginButton.setTitle("Log In", forState: UIControlState.Normal)
        loginButton.addTarget(self, action: #selector(LoginViewController.onLogin), forControlEvents: UIControlEvents.TouchUpInside)
        
        //sets auto layout for children of main view
        Style.autoViews(view)
        
        self.activateConstraints()
        
        //add tap recognition
        let tap = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.handleTap))
        tap.delegate = self
        view.addGestureRecognizer(tap)
        
    }
    
    //called upon Log In pressed
    func onLogin ()
    {
        print ("Login pressed")
        let twitterClient = BDBOAuth1SessionManager(baseURL: NSURL(string: "https://api.twitter.com")!, consumerKey: "P7JEB0pyp1EXlyVIOHPrcCaYl", consumerSecret: "K3XYKTTZ90Gv6yRNbiqoLDgNcwCgX7IXlnZusCN1EZ88TRdCcq")
        
        twitterClient.deauthorize()
        
        twitterClient.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string: "mytwitterclient://oauth"), scope: nil, success:
            {(requestToken: BDBOAuth1Credential!) -> Void in
                print ("I got a token")
                let url = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")!
                UIApplication.sharedApplication().openURL(url)
            }, failure: {(error) in
                print ("error in login")})
        
        //self.presentViewController(FeedViewController(), animated: true, completion: nil)
    }
    
    //ends editing on Tap on main view
    func handleTap()
    {
        view.endEditing(true)
    }
    
    //generate constraints for UI
    func activateConstraints()
    {
        //LOGO FIELD LAYOUT
        
        //positions bottom on screen
        NSLayoutConstraint(item: logoDisplay, attribute: .Bottom, relatedBy: .GreaterThanOrEqual, toItem: view, attribute: .Bottom, multiplier: 0.3, constant: 0.0).active = true
        
        //x-centers logo
        NSLayoutConstraint(item: logoDisplay, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0).active = true
        
        //makes label the width of the display
        NSLayoutConstraint(item: logoDisplay, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1.0, constant: 0.0).active = true
        
        //makes label as large as possible
        NSLayoutConstraint(item: logoDisplay, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.25, constant: 0.0).active = true
        
        //defines how wide the text fields are in relation to the parent view
        let field_width_multiplier:CGFloat = 0.5
        
        //USER FIELD LAYOUT
        
        //positions userField at top of parent view, offset by 30
        NSLayoutConstraint(item: userField, attribute: .Bottom, relatedBy: .GreaterThanOrEqual, toItem: view, attribute: .Bottom, multiplier: 0.45, constant: 0.0).active = true
        
        //width = field_width_multiplier of parent width
        NSLayoutConstraint(item: userField, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: field_width_multiplier, constant: 0.0).active = true
        
        //centers the field in the view horizontally
        NSLayoutConstraint(item: userField, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0).active = true
        
        //sets height to 30pts
        NSLayoutConstraint(item: userField, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.0, constant: 30.0).active = true
        
        //PASSWORD FIELD LAYOUT
        
        //positions passField at top of parent view, offset by 30
        NSLayoutConstraint(item: passField, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 0.6, constant: 0.0).active = true
        
        //width = field_width_multiplier of parent width
        NSLayoutConstraint(item: passField, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: field_width_multiplier, constant: 0.0).active = true
        
        //horizntally centers password field in view
        NSLayoutConstraint(item: passField, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0).active = true
        
        //sets height to 30pts
        NSLayoutConstraint(item: passField, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.0, constant: 30.0).active = true
        
        //LOGIN BUTTON LAYOUT
        
        //positions button y-wise on screen
        NSLayoutConstraint(item: loginButton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 0.8, constant: 0.0).active = true
        
        //makes button the same width as parent
        NSLayoutConstraint(item: loginButton, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1.0, constant: 0.0).active = true
        
        //makes button as large as possible
        NSLayoutConstraint(item: loginButton, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.1, constant: 0.0).active = true

        
    }
    


}
