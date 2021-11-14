//
//  WelcomeViewController.swift
//  29th_iOS_Assignment
//
//  Created by 배은서 on 2021/10/06.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var loginOtherAccountButton: UIButton!
    var name: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupWelcomeLabel()
    }
    
    private func setupWelcomeLabel() {
        guard let name = name else { return }
        welcomeLabel.text = "\(name)님\n환영합니다!"
    }

    @IBAction private func confirmButtonDidTap(_ sender: Any) {
        let tabBarStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let mainTabBarController = tabBarStoryBoard.instantiateViewController(withIdentifier: "MainTabBarController") as? MainTabBarController
        else { return }
        
        mainTabBarController.modalPresentationStyle = .fullScreen
        
        self.present(mainTabBarController, animated: true, completion: nil)
    }
    
    @IBAction private func loginOtherAccountButtonDidTap(_ sender: Any) {
        guard let presentingViewController = self.presentingViewController as? UINavigationController
        else { return }
        
        self.dismiss(animated: true) {
            presentingViewController.popToRootViewController(animated: true)
        }
    }
}
