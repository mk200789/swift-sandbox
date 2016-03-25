//
//  GroceryListTableViewController.swift
//  
//
//  Created by Wan Kim Mok on 3/4/16.
//
//

import UIKit

class GroceryListTableViewController: UITableViewController {
    
    let ListToUsers = "ListToUsers"
    
    var items = [Item]()
    
    //connection to demo7011 database
    let ref = Firebase(url: "https://demo7011.firebaseio.com/grocery-items")
    let usersRef = Firebase(url: "https://demo7011.firebaseio.com/online")
    var user: User!
    var userCountBarButtonItem : UIBarButtonItem!
    

    @IBAction func logout(sender: AnyObject) {
        ref.unauth()
        self.performSegueWithIdentifier("LogOff", sender: nil)
    }
    

    override func viewDidAppear(animated: Bool) {
        
        //check if in authentication state
        ref.observeAuthEventWithBlock { (authData) -> Void in
            if authData == nil{
                //user is authenticated
                print("\nSomeone is unauthenticated\n")
                self.performSegueWithIdentifier("LogOff", sender: nil)

            }
            else{
                print("\nSomeone is authenticated\n")
                
                self.user = User(authData: authData)
                
                //create a child reference with a unique id
                let currentUserRef = self.usersRef.childByAutoId()
                
                //save the curent user to the online users list
                currentUserRef.setValue(self.user.email)
                
                //when user disconnects/log off remove all the value
                currentUserRef.onDisconnectRemoveValue()
           
            }
        }
        

        //create a value observer
        usersRef.observeEventType(.Value, withBlock: { (snapshot: FDataSnapshot!) in
            //check if the snapshot exist
            if snapshot.exists(){
                //get the number of users online from the childrenCount property
                self.userCountBarButtonItem?.title = snapshot.childrenCount.description
            }
            else{
                self.userCountBarButtonItem?.title = "0"
            }
        })
        
        
        
    }
    
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //query for items by completed property
        ref.queryOrderedByChild("completed").observeEventType(.Value, withBlock: { snapshot in
            var newItems = [Item]()
            
            for item in snapshot.children.allObjects as [FDataSnapshot]{
                let groceryItem = Item(snapshot: item as FDataSnapshot)
                newItems.append(groceryItem)
            }
            
            self.items = newItems
            
            self.tableView.reloadData()
        })
        
        //set up swipe to delete
        tableView.allowsMultipleSelectionDuringEditing = false
        
        print("grocery lists\n")
        
        //user count
        userCountBarButtonItem = UIBarButtonItem(title: "1", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("userCountButtonDidTouch"))
        userCountBarButtonItem.tintColor = UIColor.redColor()
        
        //set left bar button to userCountBarButtonItem
        navigationItem.leftBarButtonItem = userCountBarButtonItem

    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func userCountButtonDidTouch(){
        performSegueWithIdentifier(ListToUsers, sender: nil)
    }
    
    
    
    //adds grocery item to grocery list
    @IBAction func addGroceryItem(sender: AnyObject) {

        var alert = UIAlertController(title: "New grocery item", message: "Add a new grocery item", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default) { (action: UIAlertAction!) -> Void in
            //get item name
            let itemName = alert.textFields![0] as UITextField
            //create a new Item
            let groceryItem = Item(name: itemName.text, addedByUser: self.user.email, completed: false)
            //create a child's id from item's name as lowercase string
            let groceryItemRef = self.ref.childByAppendingPath(itemName.text.lowercaseString)
            //save grocery item in AnyObject form
            groceryItemRef.setValue(groceryItem.toAnyObject())
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default) { (action: UIAlertAction!) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler { (item) -> Void in
            item.placeholder = "Enter item name"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)

    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return items.count
    }
    
   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell") as UITableViewCell
        let groceryItem = items[indexPath.row]
        
        cell.textLabel?.text = groceryItem.name
        cell.detailTextLabel?.text = groceryItem.addedByUser

        return cell
    }

    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            //get the item being deleted
            let item = items[indexPath.row]
            
            //delete from item from db 
            item.ref?.removeValue()
            
            print("DELETE!")
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
