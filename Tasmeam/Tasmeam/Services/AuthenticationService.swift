//
//  AuthenticationService.swift
//  Tasmeam
//
//  Created by Ahmed Elbasha on 9/22/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import Foundation
import Firebase

class AuthenticationService {
    static let instance = AuthenticationService()
    
    func registerUser(withEmail email: String, andPassword password: String, andDisplayName: String,registrationCompletion: @escaping (_ status: Bool, _ error: Error? ) ->()) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                registrationCompletion(false, error)
                return
            }
            
            let userData = ["providerId": user.user.providerID, "email": user.user.email, "displayName": user.user.displayName]
            DataService.instance.createDBUserData(uid: user.user.uid, userData: userData as Dictionary<String, AnyObject>)
            
            registrationCompletion(true, nil)
        }
    }
    
    func loginUser(withEmail email: String, andPassword password: String, loginCompletion: @escaping (_ status: Bool, _ error: Error?) ->()) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                loginCompletion(false, error)
                return
            }
            
            loginCompletion(true, nil)
        }
    }
}
