//
//  EmailSignInViewController.swift
//  Tasmeam
//
//  Created by Ahmed Elbasha on 9/12/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class EmailSignInViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Optimization for signInButton shape.
        signInButton.backgroundColor = UIColor.white
        signInButton.layer.cornerRadius = 26
        signInButton.setTitleColor(UIColor.orange, for: .normal)
        signInButton.setTitleColor(UIColor.orange, for: .highlighted)
        signInButton.layer.borderWidth = 1
        signInButton.layer.borderColor = UIColor.white.cgColor
        
        // Optimization for signUpButton shape.
        signUpButton.backgroundColor = UIColor.white
        signUpButton.layer.cornerRadius = 26
        signUpButton.setTitleColor(UIColor.orange, for: .normal)
        signUpButton.setTitleColor(UIColor.orange, for: .highlighted)
        signUpButton.layer.borderWidth = 1
        signUpButton.layer.borderColor = UIColor.white.cgColor
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        AuthenticationService.instance.loginUser(withEmail: usernameTextField.text!, andPassword: passwordTextField.text!) { (success, loginError) in
            if success {
                self.dismiss(animated: true, completion: nil)
                let emailSignInVC = self.storyboard?.instantiateViewController(withIdentifier: "EmailSignInViewController") as! EmailSignInViewController
                self.present(emailSignInVC, animated: true, completion: nil)
            } else {
                return
            }
        }
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        let signUpVC = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.present(signUpVC, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
