//
//  getProperty.swift
//  PhotoApp
//
//  Created by Wan Kim Mok on 10/19/16.
//  Copyright © 2016 Wan Kim Mok. All rights reserved.
//

import Foundation

func getVal(key: String) -> String {
    let filePath = Bundle.main.path(forResource: "config", ofType: "plist")
    let plist = NSDictionary(contentsOfFile:filePath!)
    let value = plist?.object(forKey: key) as! String
    
    return value
}


func setVal(key: String, value: String) -> String{
    let filePath = Bundle.main.path(forResource: "config", ofType: "plist")
    let plist = NSMutableDictionary(contentsOfFile:filePath!)
    plist?.setValue(value, forKey: key)
    plist?.write(toFile: filePath!, atomically: false)
    
    return value
}
