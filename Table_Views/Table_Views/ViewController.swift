//
//  ViewController.swift
//  Table_Views
//
//  Created by Wan Kim Mok on 11/14/15.
//  Copyright (c) 2015 mk200789. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        //(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
        
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        //(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel.text = "Test"
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

