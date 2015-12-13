//
//  SecondViewController.swift
//  Todo
//
//  Created by Wan Kim Mok on 12/12/15.
//  Copyright (c) 2015 mk200789. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var newItem: UITextField!
    
    @IBAction func addItemtoTodo(sender: AnyObject) {
        todoList.append(newItem.text)
        
        NSUserDefaults.standardUserDefaults().setObject(todoList, forKey: "todoList")
        
        newItem.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textfield: UITextField!) -> Bool{
        newItem.resignFirstResponder()
        return true
    }


}

