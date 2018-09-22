//
//  SignUpViewController.swift
//  Tasmeam
//
//  Created by Ahmed Elbasha on 9/12/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var displayNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        confirmButton.backgroundColor = UIColor.white
        confirmButton.layer.cornerRadius = 26
        confirmButton.setTitleColor(UIColor.orange, for: .normal)
        confirmButton.setTitleColor(UIColor.orange, for: .highlighted)
        confirmButton.layer.borderWidth = 1
        confirmButton.layer.borderColor = UIColor.white.cgColor
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func confirmButtonPressed(_ sender: Any) {
        AuthenticationService.instance.registerUser(withEmail: usernameTextField.text!, andPassword: passwordTextField.text!, andDisplayName: displayNameTextField.text!) { (success, signUpError) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
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
