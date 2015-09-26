//
//  SignInViewController.swift
//  Carousel
//
//  Created by Daniel Noskin on 9/23/15.
//  Copyright © 2015 Daniel Noskin. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var labelView: UIButton!
    @IBOutlet weak var textFieldsView: UIButton!
    @IBOutlet weak var usernameView: UITextField!
    @IBOutlet weak var passwordView: UITextField!
    @IBOutlet weak var signInView: UIImageView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var createButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func navAction(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func keyboardWillShow(sender: NSNotification) {
        keyboardShow()
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.labelView.frame.origin.y += 175
        self.textFieldsView.frame.origin.y += 125
        self.usernameView.frame.origin.y += 125
        self.passwordView.frame.origin.y += 125
        self.signInView.frame.origin.y += 300
        self.signInButton.frame.origin.y += 300
    }
    
    @IBAction func signInAction(sender: AnyObject) {
        if usernameView.text == "" || passwordView.text == "" {
            let alert = UIAlertController(title: "Invalid credentials", message: "You must enter your name and email", preferredStyle: UIAlertControllerStyle.Alert)
            let dismiss = UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Cancel, handler: nil)
            alert.addAction(dismiss)
            presentViewController(alert, animated: true, completion: nil)
            self.keyboardShow()
        } else if usernameView.text != "tim" || passwordView.text != "password" {
            self.displaySignUpPendingAlertError()
            self.keyboardShow()
        } else {
            displaySignUpPendingAlert()
            self.keyboardShow()
        }
    }
    
    func keyboardShow() {
        if labelView.frame.origin.y == 75 {
            self.labelView.frame.origin.y -= 175
            self.textFieldsView.frame.origin.y -= 125
            self.usernameView.frame.origin.y -= 125
            self.passwordView.frame.origin.y -= 125
            self.signInView.frame.origin.y -= 300
            self.signInButton.frame.origin.y -= 300
        }
    }
    
    func displaySignUpPendingAlert() -> UIAlertController {
        let pending = UIAlertController(title: "Signing in", message: nil, preferredStyle: .Alert)
        let height: NSLayoutConstraint = NSLayoutConstraint(item: pending.view, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100.0)
        pending.view.addConstraint(height)
        let indicator = UIActivityIndicatorView()
        indicator.center = CGPointMake(130.5, 65.5)
        indicator.color = UIColor.blackColor()
        indicator.startAnimating()
        pending.view.addSubview(indicator)
        
        self.presentViewController(pending, animated: true) { () -> Void in
            delay(2.0, closure: { () -> () in
                pending.dismissViewControllerAnimated(true, completion: {
                    self.performSegueWithIdentifier("signedIn", sender: self)
                })
            })
        }
        
        return pending
    }
    
    func displaySignUpPendingAlertError() -> UIAlertController {
        let pending = UIAlertController(title: "Signing in", message: nil, preferredStyle: .Alert)
        let height: NSLayoutConstraint = NSLayoutConstraint(item: pending.view, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100.0)
        pending.view.addConstraint(height)
        let indicator = UIActivityIndicatorView()
        indicator.center = CGPointMake(130.5, 65.5)
        indicator.color = UIColor.blackColor()
        indicator.startAnimating()
        pending.view.addSubview(indicator)
        
        self.presentViewController(pending, animated: true) { () -> Void in
            delay(2.0, closure: { () -> () in
                pending.dismissViewControllerAnimated(true, completion: {
                    let alert = UIAlertController(title: "Invalid credentials", message: "Username and password does not match", preferredStyle: UIAlertControllerStyle.Alert)
                    let dismiss = UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Cancel, handler: nil)
                    alert.addAction(dismiss)
                    self.presentViewController(alert, animated: true, completion: nil)
                })
            })
        }
        
        return pending
    }
}
