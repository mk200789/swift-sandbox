//
//  OnlineUsersTableViewController.swift
//  Grocr
//
//  Created by Wan Kim Mok on 3/4/16.
//  Copyright (c) 2016 mk200789. All rights reserved.
//

import UIKit

class OnlineUsersTableViewController: UITableViewController {

    let UserCell = "UserCell"
    let usersRef = Firebase(url: "https://demo7011.firebaseio.com/online")
    
    var currentUsers = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //listener to check if any user added
        usersRef.observeEventType(.ChildAdded, withBlock: { (snapshot: FDataSnapshot!) in
            //add user to currentUsers
            self.currentUsers.append(snapshot.value as String)
            
            //get index of current row
            let row = self.currentUsers.count - 1
            
            //create an nsindexpath for row
            let path = NSIndexPath(forRow: row, inSection: 0)
            
            //insert row in table with animation
            self.tableView.insertRowsAtIndexPaths([path], withRowAnimation: .Top)
        })
        
        //listener for removed user
        usersRef.observeEventType(.ChildRemoved, withBlock: { (snapshot: FDataSnapshot!) in
            let emailToFind = snapshot.value as String
            
            for (index, email) in enumerate(self.currentUsers){
                if email == emailToFind{
                    let path = NSIndexPath(forRow: index, inSection: 0)
                    self.currentUsers.removeAtIndex(index)
                    self.tableView.deleteRowsAtIndexPaths([path], withRowAnimation: .Fade)
                }
            }
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return currentUsers.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(UserCell, forIndexPath: indexPath) as UITableViewCell

        let onlineUserEmail = currentUsers[indexPath.row]
        cell.textLabel?.text = onlineUserEmail

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
