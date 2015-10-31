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
    
    @IBOutlet weak var blackBackground: UIView!
    @IBOutlet weak var blackHeader: UIImageView!
    @IBOutlet weak var blackFooter: UIImageView!
    
    var currentBackgroundColor = "light"
    
    @IBOutlet weak var selectablePhoto: UIImageView!
    var imagePosInFeed:CGPoint = CGPoint()
    
    var tapPhoto: UITapGestureRecognizer = UITapGestureRecognizer()
    var panPhoto: UIPanGestureRecognizer = UIPanGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blackBackground.alpha = 0
        
        tapPhoto = UITapGestureRecognizer(target: self, action: "didTapPhoto:")
        selectablePhoto.userInteractionEnabled = true
        selectablePhoto.addGestureRecognizer(tapPhoto)
        
        imagePosInFeed = selectablePhoto.center
        
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
        
        // Getting the image position relative to window
        let imagePos: CGPoint = self.selectablePhoto.convertPoint(self.selectablePhoto.bounds.origin, toView: self.blackBackground)
        
        self.selectablePhoto.removeFromSuperview()
        self.blackBackground.addSubview(selectablePhoto)
        self.selectablePhoto.frame.origin = imagePos
        
        self.selectablePhoto.removeGestureRecognizer(tap)
        panPhoto = UIPanGestureRecognizer(target: self, action: "panning:")
        self.selectablePhoto.addGestureRecognizer(panPhoto)
        
        currentBackgroundColor = "dark"
        preferredStatusBarStyle()
        setNeedsStatusBarAppearanceUpdate()
        UIView.animateWithDuration(0.5) { () -> Void in
            self.blackBackground.alpha = 1
        }
        
        let options: UIViewAnimationOptions = .CurveEaseInOut
        let scale = self.view.frame.width/self.selectablePhoto.frame.width
        UIView.animateWithDuration(0.6, delay: 0.1, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: options, animations: { () -> Void in
            self.selectablePhoto.transform = CGAffineTransformMakeScale(scale, scale)
            self.selectablePhoto.center = self.view.center
            }, completion: { finished in
            
        })

    }
    
    func panning(pan:UIPanGestureRecognizer) {

        let location = pan.locationInView(self.view)
        
        if pan.state == UIGestureRecognizerState.Began {
            
            self.selectablePhoto.center = location
            self.blackHeader.hidden = true
            self.blackFooter.hidden = true
            
        } else if pan.state == UIGestureRecognizerState.Changed {
            
            self.selectablePhoto.center = location
            self.blackBackground.alpha = convertValue(location.y, r1Min: self.view.center.y + 100, r1Max: self.view.frame.height - 100, r2Min: 1.0, r2Max: 0.0)
            
        } else if pan.state == UIGestureRecognizerState.Ended {
            
            
            if location.y > self.view.center.y + 100 {
                
                // Return to feed
                self.selectablePhoto.removeFromSuperview()
                self.feedScrollView.addSubview(selectablePhoto)
                
                self.selectablePhoto.removeGestureRecognizer(panPhoto)
                tapPhoto = UITapGestureRecognizer(target: self, action: "didTapPhoto:")
                self.selectablePhoto.addGestureRecognizer(tapPhoto)
                
                currentBackgroundColor = "light"
                preferredStatusBarStyle()
                setNeedsStatusBarAppearanceUpdate()
                
                UIView.animateWithDuration(0.5) { () -> Void in
                    self.blackBackground.alpha = 0
                }
                
                let options: UIViewAnimationOptions = .CurveEaseInOut
                UIView.animateWithDuration(0.6, delay: 0.1, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: options, animations: { () -> Void in
                    self.selectablePhoto.transform = CGAffineTransformMakeScale(1.0, 1.0)
                    self.selectablePhoto.center = self.imagePosInFeed
                    }, completion: { finished in
                })
            
            } else {
                
                self.blackHeader.hidden = false
                self.blackFooter.hidden = false
                
                UIView.animateWithDuration(0.2) { () -> Void in
                    self.blackBackground.alpha = 1
                }
                
                // Bounce back to center
                let options: UIViewAnimationOptions = .CurveEaseInOut
                UIView.animateWithDuration(0.6, delay: 0.1, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: options, animations: { () -> Void in
                    self.selectablePhoto.center = self.view.center
                    }, completion: { finished in
                })
            }
        }
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
