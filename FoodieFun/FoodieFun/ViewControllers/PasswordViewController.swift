//
//  PasswordViewController.swift
//  FoodieFun
//
//  Created by Enayatullah Naseri on 8/26/19.
//  Copyright © 2019 Enayatullah Naseri. All rights reserved.
//

import UIKit

enum LoginType {
    case signUp
    case signIn
}


class PasswordViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var segmentControllerOutlet: UISegmentedControl!
    @IBOutlet weak var signupOutlet: UIButton!
    
    var signinController: SingInController!
    var loginType = LoginType.signUp
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.signupOutlet.backgroundColor = UIColor(hue: 190/360, saturation: 70/100, brightness: 80/100, alpha: 1)
        self.signupOutlet.tintColor = .white
        self.signupOutlet.layer.cornerRadius = 8.0
    }
    
    
    @IBAction func signupControllerAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.loginType = .signUp
            self.signupOutlet.setTitle("Sign Up", for: .normal)
        } else {
            self.loginType = .signIn
            self.signupOutlet.setTitle("Sign In", for: .normal)
        }
    }
    
    @IBAction func signupsigninButton(_ sender: UIButton) {
        guard let signinController = self.signinController else { return }
        
        if let username = self.usernameTextField.text, !username.isEmpty,
            let password = self.passwordTextField.text, !password.isEmpty {
            let user = User(username: username, password: password)
            
            if loginType == .signUp {
                signinController.signUp(with: user) { (error) in
                    if let error = error {
                        NSLog("Error occurred during sign up: \(error)")
                    } else {
                        DispatchQueue.main.async {
                            let alertController = UIAlertController(title: "Sign Up Successful", message: "Now please log in.", preferredStyle: .alert)
                            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                            alertController.addAction(alertAction)
                            self.present(alertController, animated: true, completion: {
                                self.loginType = .signIn
                                self.segmentControllerOutlet.selectedSegmentIndex = 1
                                self.signupOutlet.setTitle("Sign In", for: .normal)
                            })
                        }
                    }
                }
            } else {
                signinController.signIn(with: user) { (error) in
                    if let error = error {
                        NSLog("Error occurred during sign in: \(error)")
                    } else {
                        DispatchQueue.main.async {
                            self.dismiss(animated: true, completion: nil)
                        }
                    }
                }
            }
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


