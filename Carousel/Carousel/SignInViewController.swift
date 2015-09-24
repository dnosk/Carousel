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
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func keyboardWillShow(sender: NSNotification) {
        if labelView.frame.origin.y == 75 {
            self.labelView.frame.origin.y -= 175
            self.textFieldsView.frame.origin.y -= 125
            self.usernameView.frame.origin.y -= 125
            self.passwordView.frame.origin.y -= 125
            self.signInView.frame.origin.y -= 300
            self.signInButton.frame.origin.y -= 300
        }
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
            let alert = UIAlertView(title: "Invalid credentials", message: "You must enter your name and email", delegate: nil, cancelButtonTitle: "Dismiss")
            alert.show()
        } else if usernameView.text != "dnosk" && passwordView.text != "password" {
            let alert = UIAlertView(title: "Invalid credentials", message: "Incorrect username and password", delegate: nil, cancelButtonTitle: "Dismiss")
            alert.show()
        } else {
            print("success")
        }
    }
}
