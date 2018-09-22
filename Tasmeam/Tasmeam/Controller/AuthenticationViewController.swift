//
//  AuthenticationViewController.swift
//  Tasmeam
//
//  Created by Ahmed Elbasha on 9/11/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class AuthenticationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginWithFacebookButtonPressed(_ sender: Any) {
    }
    
    @IBAction func loginWithGooglePlusButtonPressed(_ sender: Any) {
    }
    
    @IBAction func loginByEmailButtonPressed(_ sender: Any) {
        let emailSignInVC = storyboard?.instantiateViewController(withIdentifier: "EmailSignInViewController") as! EmailSignInViewController
        self.present(emailSignInVC, animated: true, completion: nil)
    }
}

