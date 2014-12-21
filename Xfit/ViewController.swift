//
//  ViewController.swift
//  Xfit
//
//  Created by Andrew on 12/21/14.
//  Copyright (c) 2014 Broken Games. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var fb: Firebase!
    
    @IBOutlet weak var textField: UITextField!

    @IBAction func `do`(sender: AnyObject) {
        var dataRef = self.fb.childByAppendingPath("someData")
        
        if self.textField.hasText() {
            dataRef.setValue(self.textField.text)
            self.textField.text = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fb.observeEventType(.Value, withBlock: {
            snapshot in
            println("\(snapshot.key) -> \(snapshot.value)")
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

