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
    
    let email = "sam@mail.com"
    let password = "password"
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidesWhenStopped = true

        // Look for keyboard opening
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillChangeFrameNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
    }
    
    override func viewWillAppear(animated: Bool) {
        signInScrollView.alpha = 0.0
        signInScrollView.transform = CGAffineTransformMakeScale(0.8, 0.8)
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.15) { () -> Void in
            self.signInScrollView.alpha = 1.0
            self.signInScrollView.transform = CGAffineTransformMakeScale(1.0, 1.0)
        }
    }
    
    // Scroll up when keyboard opens
    func keyboardWillShow(notification: NSNotification) {
        self.signInScrollView.contentOffset.y = 100
        self.signInScrollView.scrollEnabled = true

    }
    
    // Scroll down when keyboard closes
    func keyboardWillHide(notification: NSNotification) {
        self.signInScrollView.contentOffset.y = 0
        self.signInScrollView.scrollEnabled = false
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
        
        let fields = (emailTextField.text!,passwordTextField.text!)
        
        switch fields {
        case ("",""):
            let alertController = UIAlertController(title: "Email and password required", message: "Please enter your email address and password", preferredStyle: .Alert)
            let OK = UIAlertAction(title: "OK", style: .Default) { (action) in
            }
            alertController.addAction(OK)
            presentViewController(alertController, animated: true) {
            }
        case ("",_):
            let alertController = UIAlertController(title: "Email address required", message: "Please enter your email address", preferredStyle: .Alert)
            let OK = UIAlertAction(title: "OK", style: .Default) { (action) in
            }
            alertController.addAction(OK)
            presentViewController(alertController, animated: true) {
            }
        case (_,""):
            let alertController = UIAlertController(title: "Password required", message: "Please enter your password", preferredStyle: .Alert)
            let OK = UIAlertAction(title: "OK", style: .Default) { (action) in
            }
            alertController.addAction(OK)
            presentViewController(alertController, animated: true) {
            }
        case let (e,p) where e != email || p != password:
            let alertController = UIAlertController(title: "Sign in failed", message: "Incorrect email address or password", preferredStyle: .Alert)
            let OK = UIAlertAction(title: "OK", style: .Default) { (action) in
            }
            alertController.addAction(OK)
            activityIndicator.startAnimating()
            delay(2.0, closure: {
                self.activityIndicator.stopAnimating()
                self.presentViewController(alertController, animated: true) {
                }
            })
        default:
            activityIndicator.startAnimating()
            delay(1.0, closure: {
                self.activityIndicator.stopAnimating()
                let alertController = UIAlertController(title: "Signing in...", message: nil, preferredStyle: .Alert)
                self.presentViewController(alertController, animated: true) {
                    delay(1.5, closure: {
                        alertController.dismissViewControllerAnimated(true, completion: { () -> Void in
                            self.performSegueWithIdentifier("loginSegue", sender: nil)
                        })
                    })
                }
            })
        }
    }
    
    @IBAction func didTapScreen(sender: AnyObject) {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
