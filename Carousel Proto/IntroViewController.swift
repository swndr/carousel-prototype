//
//  ViewController.swift
//  Carousel Proto
//
//  Created by Sam Wander on 10/27/15.
//  Copyright © 2015 Sam Wander. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introScrollView.contentSize = CGSize(width: 320, height: 1136)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

