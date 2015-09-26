//
//  WelcomeViewController.swift
//  Carousel
//
//  Created by Daniel Noskin on 9/25/15.
//  Copyright © 2015 Daniel Noskin. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var welcome1: UIImageView!
    @IBOutlet weak var welcome2: UIImageView!
    @IBOutlet weak var carouselSpinView: UIButton!
    
    var page = 0
    var pointNow: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = CGSize(width: 1280, height: 568)
        scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        pointNow = scrollView.contentOffset
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {

        if scrollView.contentOffset.x < pointNow!.x {
            print("left")
            page -= 1
            pageControl.currentPage = page
            if carouselSpinView.alpha == 1 {
                carouselSpinView.alpha = 0
                pageControl.alpha = 1
            }
        } else if scrollView.contentOffset.x > pointNow!.x {
            print("right")
            page += 1
            if page == 3 {
                carouselSpinView.alpha = 1
                pageControl.alpha = 0
            } else {
                pageControl.currentPage = page
            }
        }
    }
}
