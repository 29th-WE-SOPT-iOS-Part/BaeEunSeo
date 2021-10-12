//
//  LoginViewController.swift
//  29th_iOS_Assignment
//
//  Created by 배은서 on 2021/10/06.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        setupTextField()
    }
    
    private func setupButton() {
        nextButton.isEnabled = false
    }
    
    private func setupTextField() {
        [nameTextField, emailTextField, passwordTextField].forEach {
            $0?.delegate = self
        }
    }
    
    @IBAction private func touchUpSignUpButton() {
        guard let signUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") else { return }
        
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    @IBAction private func touchUpNextButton() {
        guard let welcomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController else { return }
        
        welcomeViewController.name = nameTextField.text
        
        self.present(welcomeViewController, animated: true, completion: nil)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let isNameEmpty = nameTextField.text?.isEmpty,
              let isEmailEmpty = emailTextField.text?.isEmpty,
              let isPasswordEmpty = passwordTextField.text?.isEmpty
        else { return }
        
        if isNameEmpty || isEmailEmpty || isPasswordEmpty {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
    }
}
