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
    @IBOutlet weak var showPasswordButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled = false
        
        nameTextField.addTarget(self, action: #selector(changeButtonState), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(changeButtonState), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(changeButtonState), for: .editingChanged)
        
        showPasswordButton.addTarget(self, action: #selector(touchUpShowPasswordButton), for: .touchUpInside)
    }
    
    @IBAction private func touchUpNextButton() {
        guard let welcomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController else { return }
        
        welcomeViewController.name = nameTextField.text
        
        self.present(welcomeViewController, animated: true, completion: nil)
    }
    
    @objc private func changeButtonState() {
        guard let name = nameTextField.text,
              let email = emailTextField.text,
              let password = passwordTextField.text
        else { return }
        
        if name.isEmpty || email.isEmpty || password.isEmpty {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
    }
    
    @objc func touchUpShowPasswordButton() {
        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
            showPasswordButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            showPasswordButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
    }
    
}
