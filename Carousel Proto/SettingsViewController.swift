//
//  SettingsViewController.swift
//  Carousel Proto
//
//  Created by Sam Wander on 10/27/15.
//  Copyright © 2015 Sam Wander. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func didPressCloseButton(sender: AnyObject) {
        print("closed")
        // Fix this
        navigationController?.popToRootViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
