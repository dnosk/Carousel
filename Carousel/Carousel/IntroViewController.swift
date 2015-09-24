//
//  IntroViewController.swift
//  Carousel
//
//  Created by Daniel Noskin on 9/23/15.
//  Copyright © 2015 Daniel Noskin. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var createAccount: UIButton!
    @IBOutlet weak var signIn: UIButton!
    
    var isBottom: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = imageView.image!.size
        scrollView.delegate = self
        scrollToTop()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        if scrollView.contentSize == CGSizeMake(320, 566){
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                scrollView.contentSize = self.imageView.image!.size
                self.imageView.center.y = self.imageView.center.y + 566
                self.createAccount.frame = CGRectMake(21, 1005, 279, 50)
                self.signIn.frame = CGRectMake(21, 1064, 279, 50)
                self.scrollToTop()
            })
        } else {
            UIView.animateWithDuration(0.5) { () -> Void in
                scrollView.contentSize = CGSizeMake(320, 566)
                self.imageView.center.y = self.imageView.center.y - 566
                self.createAccount.frame = CGRectMake(21, 439, 279, 50)
                self.signIn.frame = CGRectMake(21, 498, 279, 50)
                
                self.image1.transform = CGAffineTransformMakeRotation((0.0 * CGFloat(M_PI)) / 180.0)
                self.image2.transform = CGAffineTransformMakeRotation((0.0 * CGFloat(M_PI)) / 180.0)
                self.image3.transform = CGAffineTransformMakeRotation((0.0 * CGFloat(M_PI)) / 180.0)
                self.image4.transform = CGAffineTransformMakeRotation((0.0 * CGFloat(M_PI)) / 180.0)
                self.image5.transform = CGAffineTransformMakeRotation((0.0 * CGFloat(M_PI)) / 180.0)
                self.image6.transform = CGAffineTransformMakeRotation((0.0 * CGFloat(M_PI)) / 180.0)
                
                self.image1.frame = CGRectMake(45, 189, 153, 152)
                self.image2.frame = CGRectMake(199, 189, 76, 75)
                self.image3.frame = CGRectMake(199, 265, 76, 76)
                self.image4.frame = CGRectMake(45, 342, 76, 76)
                self.image5.frame = CGRectMake(122, 342, 76, 75)
                self.image6.frame = CGRectMake(199, 343, 76, 75)
            }
        }
    }
    
    func scrollToTop(){
        image1.frame = CGRectMake(-14, 440, 125, 125)
        image2.frame = CGRectMake(200, 440, 125, 125)
        image3.frame = CGRectMake(200, 340, 125, 125)
        image4.frame = CGRectMake(90, 440, 125, 125)
        image5.frame = CGRectMake(-14, 340, 125, 125)
        image6.frame = CGRectMake(90, 340, 125, 125)
        
        image1.transform = CGAffineTransformMakeRotation((-10.0 * CGFloat(M_PI)) / 180.0)
        image2.transform = CGAffineTransformMakeRotation((-10.0 * CGFloat(M_PI)) / 180.0)
        image3.transform = CGAffineTransformMakeRotation((10.0 * CGFloat(M_PI)) / 180.0)
        image4.transform = CGAffineTransformMakeRotation((10.0 * CGFloat(M_PI)) / 180.0)
        image5.transform = CGAffineTransformMakeRotation((10.0 * CGFloat(M_PI)) / 180.0)
        image6.transform = CGAffineTransformMakeRotation((-10.0 * CGFloat(M_PI)) / 180.0)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    /* 
    
    45 189
    199 189
    199 265
    45 342
    122 342
    199 343
    
    */
}
