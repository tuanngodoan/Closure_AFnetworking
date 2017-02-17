//
//  ViewController.swift
//  Closure_sw
//
//  Created by mac on 2/17/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginButton(sender: AnyObject) {
        
    }
  
    
    @IBAction func registorButton(sender: AnyObject) {

    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destView = segue.destinationViewController as! RegisterViewController
        
        destView.infoUserBlock = {(userNameText: String,passwordText: String) in
            self.userNameTextField.text = userNameText
            self.passwordTextField.text = passwordText
            
        }
        
}

}