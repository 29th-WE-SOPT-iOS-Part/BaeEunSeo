//
//  LoginViewController.swift
//  29th_iOS_Assignment
//
//  Created by 배은서 on 2021/10/06.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func touchUpSignUpButton() {
        guard let signUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") else { return }
        
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    @IBAction private func touchUpNextButton() {
        guard let welcomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") else { return }
        
        self.present(welcomeViewController, animated: true, completion: nil)
    }

}

