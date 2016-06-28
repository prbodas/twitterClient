//
//  ViewController.swift
//  Twitter
//
//  Created by Prachi Bodas on 6/27/16.
//  Copyright © 2016 Prachi Bodas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*view.backgroundColor = UIColor.blueColor()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        //make first text field
        let field = UITextField()//frame: CGRectMake(100,100,50,50))
        field.backgroundColor = UIColor.whiteColor()
        view.addSubview(field)
        //field.borderStyle = UITextBorderStyle.RoundedRect
        field.placeholder = "Hello"
        field.translatesAutoresizingMaskIntoConstraints = false
        
        //make second text
        let newfield = UITextField()//frame: CGRectMake(100,200,100,50))
        newfield.backgroundColor = UIColor.redColor()
        newfield.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(newfield)
        newfield.borderStyle = UITextBorderStyle.RoundedRect
        newfield.placeholder = "second"
        
        //add constraints
        
        // Get the superview's layout
        //let margins = view.layoutMarginsGuide
        
        // Pin the leading edge of myView to the margin's leading edge
        field.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor, constant: 10.0).active = true
        
        // Pin the trailing edge of myView to the margin's trailing edge
        field.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor).active = true
        
        //Pin the top 10 points down
        NSLayoutConstraint(item: field, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 100.0).active = true
        
        //Pin newField 20 points below field
        NSLayoutConstraint(item: newfield, attribute: .Top, relatedBy: .Equal, toItem: field, attribute: .Top, multiplier: 2.0, constant: 0.0).active = true
        
        // Give myView a 1:2 aspect ratio
        //field.heightAnchor.constraintEqualToAnchor(field.widthAnchor, multiplier: 2.0).active =
        
        //NSLayoutConstraint(item: field, attribute: .Width, relatedBy: .Equal, toItem: field, attribute:.Width, multiplier: 1.0, constant:0.0).active = true
        
        
        
        let tap = UITapGestureRecognizer(target: self, action: Selector("handleTap"))
        tap.delegate = self
        //view.addGestureRecognizer(tap)*/
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*func handleTap()
    {
        view.endEditing(true)
    }*/


}

