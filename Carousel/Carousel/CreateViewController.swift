//
//  CreateViewController.swift
//  Carousel
//
//  Created by Daniel Noskin on 9/25/15.
//  Copyright © 2015 Daniel Noskin. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var create: UIButton!
    @IBOutlet weak var terms: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }

    func keyboardWillShow(sender: NSNotification) {
        if create.frame.origin.y == 470 {
            self.create.frame.origin.y -= 205
            self.terms.frame.origin.y -= 217
        }
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.create.frame.origin.y += 205
        self.terms.frame.origin.y += 217
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
