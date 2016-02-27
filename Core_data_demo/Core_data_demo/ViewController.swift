//
//  ViewController.swift
//  Core_data_demo
//
//  Created by Wan Kim Mok on 2/23/16.
//  Copyright (c) 2016 mk200789. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //refers to AppDelegate
        let appDel: AppDelegate =  UIApplication.sharedApplication().delegate as AppDelegate
        
        //allows to access coredata database
        let context: NSManagedObjectContext = appDel.managedObjectContext!
/*
        //Adds a user to the database
        //1.specify which entity your going to use
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as NSManagedObject
        //2.set the value for username
        newUser.setValue("Kim", forKey:"username")
        //3.set the value for password
        newUser.setValue("password123", forKey:"password")
        //4.save to database (by calling the context)
        /*
        In Swift 2 for handling errors
        do{
            try context.save(nil)
        }
        catch{
            print("There's an error!")
        }
        */
        context.save(nil)
*/
        
        //create a request that allows us to get data from users entity
        let request = NSFetchRequest(entityName: "Users")
        
        
        //add a predicate to search for Ling
        request.predicate = NSPredicate(format: "username = %@" , "Ling")
        

        //fetch request
        /*
        In Swift 2
        
        //enables us to see data actual values
        //request.returnsObjectAsFaults = false
        do {
            try let results = context.executeFetchRequest(request)
        }
        catch{
            print("Fetch failed")
        }
        */
        
        let results = context.executeFetchRequest(request, error:nil)
        
        if results?.count > 0 {
            print("there is results!: \n")
            
            for result in results as [NSManagedObject]{
                
                //changing username Yale to Ling
                //result.setValue("Ling", forKey: "username")
                
                //save changes
                //context.save(nil)
                
                //delete username(s) Ling
                context.deleteObject(result)
                context.save(nil)
                
                //converting results username type to a string
                if let username = result.valueForKey("username") as? String{
                    print(username)
                }
            }
        }
        else{
            print("there is no results")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

