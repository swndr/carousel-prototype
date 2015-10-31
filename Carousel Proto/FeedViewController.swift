//
//  FeedViewController.swift
//  Carousel Proto
//
//  Created by Sam Wander on 10/27/15.
//  Copyright © 2015 Sam Wander. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var scrubberScrollView: UIScrollView!
    
    @IBOutlet weak var blackBackgroundImageView: UIImageView!
    var currentBackgroundColor = "light"
    
    @IBOutlet weak var selectablePhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blackBackgroundImageView.alpha = 0
        
        let tapPhoto: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "didTapPhoto:")
        selectablePhoto.userInteractionEnabled = true
        selectablePhoto.addGestureRecognizer(tapPhoto)
        
        preferredStatusBarStyle()
        setNeedsStatusBarAppearanceUpdate()
        
        feedScrollView.contentSize = CGSize(width: 320, height: 1628)
        scrubberScrollView.contentSize = CGSize(width: 840, height: 36)
        feedScrollView.contentOffset.y = 1060
        scrubberScrollView.contentOffset.x = 520
        
        feedScrollView.delegate = self
        scrubberScrollView.delegate = self
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView == scrubberScrollView {
            let feedOffset = convertValue(scrollView.contentOffset.x, r1Min: 0, r1Max: 520, r2Min: 0, r2Max: 1060)
            feedScrollView.contentOffset.y = feedOffset
        } else {
            let scrubOffset = convertValue(scrollView.contentOffset.y, r1Min: 0, r1Max: 1060, r2Min: 0, r2Max: 520)
            scrubberScrollView.contentOffset.x = scrubOffset
        }
    }
    
    func didTapPhoto(tap:UITapGestureRecognizer) {
        currentBackgroundColor = "dark"
        preferredStatusBarStyle()
        setNeedsStatusBarAppearanceUpdate()
        UIView.animateWithDuration(0.5) { () -> Void in
            self.blackBackgroundImageView.alpha = 1
        }
        
        // Getting the image position relative to window
        let imagePos: CGPoint = self.selectablePhoto.convertPoint(self.selectablePhoto.frame.origin, toView: self.view)
        print(imagePos)
    }
    
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        switch currentBackgroundColor {
        case "dark": return .LightContent
        default: return .Default
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
