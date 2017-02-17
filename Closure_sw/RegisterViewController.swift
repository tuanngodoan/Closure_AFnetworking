//
//  NextViewController.swift
//  Closure_sw
//
//  Created by mac on 2/17/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var userRegisterTextField: UITextField!
    
    @IBOutlet weak var passwordRegisterTextField: UITextField!
    
    
    var infoUserBlock: ((userNameText: String,passwordText: String) -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func registorClosureButton(sender: AnyObject) {
        infoUserBlock?(userNameText: userRegisterTextField.text!, passwordText: passwordRegisterTextField.text!)  
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
       
    }
    

}
