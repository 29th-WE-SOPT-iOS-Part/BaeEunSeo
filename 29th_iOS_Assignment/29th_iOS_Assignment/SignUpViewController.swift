//
//  SignUpViewController.swift
//  29th_iOS_Assignment
//
//  Created by 배은서 on 2021/10/06.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func touchUpNextButton() {
        guard let welcomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController else { return }
        
        welcomeViewController.name = nameTextField.text
        
        self.present(welcomeViewController, animated: true, completion: nil)
    }
}
