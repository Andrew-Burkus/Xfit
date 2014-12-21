//
//  SignInViewController.swift
//  Xfit
//
//  Created by Andrew on 12/21/14.
//  Copyright (c) 2014 Broken Games. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    var fb = Firebase(url:"https://sizzling-fire-9441.firebaseio.com/")
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func signIn(sender: AnyObject) {
        self.fb.authUser(self.email.text, password: self.password.text) {
            error, authData in
            if (error != nil) {
                // an error occurred while attempting login
                if let errorCode = FAuthenticationError(rawValue: error.code) {
                    switch (errorCode) {
                    case .UserDoesNotExist:
                        // Handle invalid user
                        break
                    case .InvalidEmail:
                        // Handle invalid email
                        break
                    case .InvalidPassword:
                        // Hand invalid password
                        break
                    default:
                        
                        break
                    }
                }
            } else {
                // User is logged in
                self.performSegueWithIdentifier("SignInSegue", sender: self)
            }
        }
    }
    
    override func viewDidLoad() {
        self.fb.observeEventType(.Value, withBlock: {
            snapshot in
            println("\(snapshot.key) -> \(snapshot.value)")
        })
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let viewController = segue.destinationViewController as ViewController
        viewController.fb = self.fb
    }
}