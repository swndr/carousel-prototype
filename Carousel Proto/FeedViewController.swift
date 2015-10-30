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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedScrollView.contentSize = CGSize(width: 320, height: 1628)
        scrubberScrollView.contentSize = CGSize(width: 840, height: 36)
        scrubberScrollView.contentOffset.x = 0
        
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
    

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
