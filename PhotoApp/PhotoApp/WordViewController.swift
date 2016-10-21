//
//  WordViewController.swift
//  PhotoApp
//
//  Created by Wan Kim Mok on 10/20/16.
//  Copyright © 2016 Wan Kim Mok. All rights reserved.
//

import UIKit

class WordViewController: UIViewController, UITableViewDelegate {

    var wordList : NSArray = []
    var word : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        word = wordList as! [String]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return word.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "word_identifier")
        
        cell.textLabel?.text = word[indexPath.row]//word[(indexPath as NSIndexPath).row]
        
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
