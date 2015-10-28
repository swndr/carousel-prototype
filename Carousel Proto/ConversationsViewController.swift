//
//  ConversationsViewController.swift
//  Carousel Proto
//
//  Created by Sam Wander on 10/27/15.
//  Copyright © 2015 Sam Wander. All rights reserved.
//

import UIKit

class ConversationsViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func didPressBackButton(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
