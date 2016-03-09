//
//  Item.swift
//  Grocr
//
//  Created by Wan Kim Mok on 3/5/16.
//  Copyright (c) 2016 mk200789. All rights reserved.
//

import Foundation

struct Item {
    let key: String
    let name: String
    let addedByUser: String
    let completed: Bool
    let ref: Firebase?
    
    //initialize arbitrary data
    init(key: String = "", name: String, addedByUser: String, completed: Bool){
        self.key = key
        self.name = name
        self.addedByUser = addedByUser
        self.completed = completed
        self.ref = nil
    }
    
    init(snapshot: FDataSnapshot){
        key = snapshot.key
        name = snapshot.value["name"] as String
        addedByUser = snapshot.value["addedByUser"] as String
        completed = snapshot.value["completed"] as Bool
        ref = snapshot.ref
    }
    
    func toAnyObject() -> AnyObject{
        return [
            "name": name,
            "addedByUser": addedByUser,
            "completed": completed
        ]
    }
}