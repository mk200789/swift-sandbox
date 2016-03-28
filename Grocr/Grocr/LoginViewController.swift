//
//  LoginViewController.swift
//  Grocr
//
//  Created by Wan Kim Mok on 3/4/16.
//  Copyright (c) 2016 mk200789. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let ref = Firebase(url:"https://demo7011.firebaseio.com")

    @IBOutlet var email: UITextField!
    
    @IBOutlet var password: UITextField!
    
    @IBAction func resetPassword(sender: AnyObject) {
        //reset password
    }
    
    @IBAction func login(sender: AnyObject) {
        self.ref.authUser(email.text, password: password.text) { (error, auth) -> Void in
            if error != nil{
                var err = error.userInfo! as NSDictionary
                
                var preprocessMessage = err["NSLocalizedDescription"] as NSString
                
                var filterMessage = preprocessMessage.componentsSeparatedByString(")")
                
                var Message = filterMessage[1] as String
                
                let errorAlert = UIAlertController(title: "Error", message: Message , preferredStyle: .Alert)
                
                let agree = UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) -> Void in
                    
                })
                
                errorAlert.addAction(agree)
                
                self.presentViewController(errorAlert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func signup(sender: AnyObject) {
        var alert = UIAlertController(title: "Register", message: "Please enter the following:", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default) { (action: UIAlertAction!) -> Void in
            let emailField = alert.textFields![0] as UITextField
            let passwordField = alert.textFields![1] as UITextField
            
            self.ref.createUser(emailField.text, password: passwordField.text, withCompletionBlock: { (error: NSError!) -> Void in
                if error == nil{
                    self.ref.authUser(emailField.text, password: passwordField.text, withCompletionBlock: { (error, auth) in
                    })
                }
                else{
                    var err = error.userInfo! as NSDictionary
                    
                    var preprocessMessage = err["NSLocalizedDescription"] as NSString
                    
                    var filterMessage = preprocessMessage.componentsSeparatedByString(")")
                    
                    let Message = filterMessage[1] as String

                    let errorAlert = UIAlertController(title: "Error", message: Message , preferredStyle: .Alert)
                    
                    let agree = UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) -> Void in

                        self.presentViewController(alert, animated: true, completion: nil)
                    })
                    errorAlert.addAction(agree)
                    
                    self.presentViewController(errorAlert, animated: true, completion: nil)
                }
            })
        }
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default) { (action: UIAlertAction!) -> Void in
        }
        

        alert.addTextFieldWithConfigurationHandler { (textEmail) -> Void in
            textEmail.placeholder = "Enter your email"
        }
        
        alert.addTextFieldWithConfigurationHandler { (textPassword) -> Void in
            textPassword.secureTextEntry = true
            textPassword.placeholder = "Enter your password"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBOutlet var signup: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Login page")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        //check if in authentication state
        ref.observeAuthEventWithBlock { (authData) -> Void in
            if authData != nil{
                //user is authenticated
                print("\nSomeone is authenticated\n")
                self.performSegueWithIdentifier("LoginToList", sender: nil)
            }
        }
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        //close keyboard
        self.view.endEditing(true)
    }

}

