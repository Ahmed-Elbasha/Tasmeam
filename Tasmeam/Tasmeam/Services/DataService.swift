//
//  DataService.swift
//  Tasmeam
//
//  Created by Ahmed Elbasha on 9/12/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DataService {
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_NEWS = DB_BASE.child("news")
    
    var REF_BASE: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_NEWS: DatabaseReference {
        return _REF_NEWS
    }
    
    func createDBUserData(uid: String, userData: Dictionary<String, AnyObject>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    func createDBNewsData(uid: String, newsData: Dictionary<String, AnyObject>) {
        REF_NEWS.child(uid).updateChildValues(newsData)
    }
}
