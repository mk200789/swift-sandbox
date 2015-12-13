//
//  FirstViewController.swift
//  Todo
//
//  Created by Wan Kim Mok on 12/12/15.
//  Copyright (c) 2015 mk200789. All rights reserved.
//

import UIKit

//define empty todo list array
var todoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if NSUserDefaults.standardUserDefaults().objectForKey("todoList") != nil{
            todoList = NSUserDefaults.standardUserDefaults().objectForKey("todoList") as [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return todoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel.text = todoList[indexPath.row]
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        table.reloadData()
    }

}

