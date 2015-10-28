//
//  SignInViewController.swift
//  Carousel Proto
//
//  Created by Sam Wander on 10/27/15.
//  Copyright © 2015 Sam Wander. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var signInScrollView: UIScrollView!
    @IBOutlet var tapScreenGesture: UITapGestureRecognizer!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Look for keyboard opening
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillChangeFrameNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
    }
    
    // Scroll up when keyboard opens
    func keyboardWillShow(notification: NSNotification) {
        self.signInScrollView.contentOffset.y = 100

    }
    
    // Scroll down when keyboard closes
    func keyboardWillHide(notification: NSNotification) {
        self.signInScrollView.contentOffset.y = 0
    }
    
    // Tap Next in Email field
    @IBAction func didPressNextOnEmailField(sender: AnyObject) {
        self.passwordTextField.becomeFirstResponder()
    }
    
    // Tap Done in Password field
    @IBAction func didPressDoneOnPasswordField(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    @IBAction func didPressSignIn(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    @IBAction func didTapScreen(sender: AnyObject) {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
