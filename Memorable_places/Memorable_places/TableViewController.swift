//
//  TableViewController.swift
//  Memorable_places
//
//  Created by Wan Kim Mok on 2/8/16.
//  Copyright (c) 2016 mk200789. All rights reserved.
//

import UIKit


class TableViewController: UITableViewController, UITableViewDelegate {

    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.rowHeight = 44
        
        if  NSUserDefaults.standardUserDefaults().objectForKey("favorite_places") != nil{
            print("exist\n")
            print(NSUserDefaults.standardUserDefaults().objectForKey("favorite_places"))
            print(NSUserDefaults.standardUserDefaults().objectForKey("favorite_coordinates"))

        }
        else{
            print("create array ")
            //NSUserDefaults.standardUserDefaults().setObject(favoritePlaces, forKey: "favorite_places")
            //NSUserDefaults.standardUserDefaults().setObject(favoriteCoordinates, forKey: "favorite_coordinates")
            NSUserDefaults.standardUserDefaults().setObject([String](), forKey: "favorite_places")
            NSUserDefaults.standardUserDefaults().setObject([[String: NSNumber]](), forKey: "favorite_coordinates")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        var place = NSUserDefaults.standardUserDefaults().objectForKey("favorite_places") as Array<String>
        
        return place.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("places", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        let place = NSUserDefaults.standardUserDefaults().objectForKey("favorite_places") as Array<String>
        cell.textLabel.text = place[indexPath.row]
        
        //cell.textLabel.text = favoritePlaces[indexPath.row]

        return cell
    }
    
    
    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            // Delete the row from the data source
            //favoritePlaces.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            print(indexPath.row)
            
            var place = NSUserDefaults.standardUserDefaults().objectForKey("favorite_places") as Array<String>
            place.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(place, forKey: "favorite_places")

            var coordinate = NSUserDefaults.standardUserDefaults().objectForKey("favorite_coordinates") as Array<[String: NSNumber]>
            coordinate.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(coordinate, forKey: "favorite_coordinates")
            
            table.reloadData()
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func viewDidAppear(animated: Bool) {
        table.reloadData()
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
