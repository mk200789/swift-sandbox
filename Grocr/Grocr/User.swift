//
//  User.swift
//  Grocr
//
//  Created by Wan Kim Mok on 3/4/16.
//  Copyright (c) 2016 mk200789. All rights reserved.
//

import Foundation

struct User {
    let uid : String
    let email: String
    
    //Initialize from firebase
    init(authData: FAuthData){
        uid = authData.uid
        email = authData.providerData["email"] as String
    }
    
    //Initialize from abritrary data
    init(uid: String, email: String){
        self.uid = uid
        self.email = email
    }
}
