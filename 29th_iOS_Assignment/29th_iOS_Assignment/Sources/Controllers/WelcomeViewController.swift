//
//  WelcomeViewController.swift
//  29th_iOS_Assignment
//
//  Created by 배은서 on 2021/10/06.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    var name: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupWelcomeLabel()
    }
    
    private func setupWelcomeLabel() {
        guard let name = name else { return }
        welcomeLabel.text = "\(name)님\n환영합니다!"
    }

}
