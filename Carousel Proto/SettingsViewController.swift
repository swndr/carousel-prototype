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
    @IBOutlet weak var signOutButton: UIButton!
    @IBOutlet weak var settingsScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsScrollView.contentSize = CGSize(width: 320, height: 759)
    }
    
    @IBAction func didPressCloseButton(sender: AnyObject) {
        navigationController?.dismissViewControllerAnimated(true, completion:{ () -> Void in
        })
    }
    
    
    @IBAction func didPressSignOutButton(sender: AnyObject) {
        
        // Show action sheet
        let optionMenu: UIAlertController = UIAlertController(title: "Are you sure you want to sign out?", message: nil, preferredStyle: .ActionSheet)
        
        let signOutAction = UIAlertAction(title: "Sign Out", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.performSegueWithIdentifier("returnToSignIn", sender: nil)
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
    
        optionMenu.addAction(signOutAction)
        optionMenu.addAction(cancelAction)
        
        presentViewController(optionMenu, animated: true, completion: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
