//
//  WelcomeViewController.swift
//  Carousel Proto
//
//  Created by Sam Wander on 10/27/15.
//  Copyright © 2015 Sam Wander. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var welcomeScrollView: UIScrollView!
    @IBOutlet weak var welcomeButtonImage: UIImageView!
    @IBOutlet weak var welcomeButton: UIButton!
    
    @IBOutlet weak var proceedContainer: UIView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeScrollView.contentSize = CGSize(width: 1280, height: 1.0)
        welcomeScrollView.delegate = self
        proceedContainer.alpha = 0
    }
    
    // Fade out paging indicator, fade in button
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var scrollX = Int(round(scrollView.contentOffset.x))
        if scrollX > 640 {
            pageControl.alpha = convertValue(CGFloat(scrollX), r1Min: 640.00, r1Max: 860.00, r2Min: 1.0, r2Max: 0.0)
            proceedContainer.alpha = convertValue(CGFloat(scrollX), r1Min: 860.00, r1Max: 960.00, r2Min: 0.0, r2Max: 1.0)
        }
    }
    
    // Paging control
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        var page = Int(round(scrollView.contentOffset.x / 320))
        pageControl.currentPage = page
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
