//
//  LoginViewController.swift
//  29th_iOS_Assignment
//
//  Created by 배은서 on 2021/10/06.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
        setupButton()
        setupTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clearTextField()
    }
    
    private func setupLabel() {
        descriptionLabel.text = "YouTube도 이동하며 계속하세요.\n앱 및 Saferi에서도 Google 서비스에 로그인됩니다."
    }
    
    private func setupButton() {
        nextButton.isEnabled = false
    }
    
    private func setupTextField() {
        [nameTextField, emailTextField, passwordTextField].forEach {
            $0?.delegate = self
        }
    }
    
    private func clearTextField() {
        [nameTextField, emailTextField, passwordTextField].forEach {
            $0?.text = ""
        }
    }
    
    @IBAction private func touchUpSignUpButton() {
        guard let signUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") else { return }
        
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    @IBAction private func touchUpNextButton() {
        requestLogin()
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

extension LoginViewController {
    func requestLogin() {
        UserSignService.shared.login(email: emailTextField.text ?? "",
                                     password: passwordTextField.text ?? "") { responseData in
            switch responseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? SignResponse else { return }
                self.showAlert(response.message) { _ in
                    guard let welcomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController else { return }
                    
                    UserDefaults.standard.set(response.data?.name, forKey: "name")
                    
                    welcomeViewController.name = UserDefaults.standard.string(forKey: "name")
                    welcomeViewController.modalPresentationStyle = .fullScreen
                    
                    self.present(welcomeViewController, animated: true, completion: nil)
                }
            case .requestError(let message):
                guard let message = message as? String else { return }
                self.showAlert(message, completion: nil)
            case .serverError(let message):
                guard let message = message as? String else { return }
                self.showAlert(message, completion: nil)
            case .pathError:
                print("잘못된 경로입니다‼️")
            case .networkFail:
                print("서버와의 통신에 실패하였습니다🥲")
            }
        }
    }
    
    private func showAlert(_ message: String, completion: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: "로그인", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: completion)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
