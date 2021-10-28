//
//  SignUpViewController.swift
//  29th_iOS_Assignment
//
//  Created by 배은서 on 2021/10/06.
//

import UIKit

class SignUpViewController: UIViewController {
    
    enum SystemImageName {
        static let checkmark = "checkmark.square"
        static let checkmarkFill = "checkmark.square.fill"
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var showPasswordButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        setupTextField()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        clearTextField()
    }
    
    private func setupTextField() {
        [nameTextField, emailTextField, passwordTextField].forEach {
            $0?.delegate = self
        }
    }
    
    private func setupButton() {
        nextButton.isEnabled = false
        showPasswordButton.addTarget(self, action: #selector(touchUpShowPasswordButton), for: .touchUpInside)
    }
    
    private func clearTextField() {
        [nameTextField, emailTextField, passwordTextField].forEach {
            $0?.text = ""
        }
    }
    
    @IBAction private func touchUpNextButton() {
        guard let welcomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController else { return }
        
        welcomeViewController.name = nameTextField.text
        welcomeViewController.modalPresentationStyle = .fullScreen
        
        self.present(welcomeViewController, animated: true, completion: nil)
    }
    
    @objc func touchUpShowPasswordButton() {
        passwordTextField.isSecureTextEntry == true ? setShowPasswordButtonImage(SystemImageName.checkmark) : setShowPasswordButtonImage(SystemImageName.checkmarkFill)
        
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    private func setShowPasswordButtonImage(_ imageName: String) {
        showPasswordButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
}

extension SignUpViewController: UITextFieldDelegate {
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
