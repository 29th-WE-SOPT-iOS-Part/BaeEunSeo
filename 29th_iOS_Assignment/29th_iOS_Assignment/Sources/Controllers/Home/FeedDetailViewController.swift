//
//  FeedDetailViewController.swift
//  29th_iOS_Assignment
//
//  Created by 배은서 on 2021/12/24.
//

import UIKit

class FeedDetailViewController: UIViewController {
    static let identifier = "FeedDetailViewController"

    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var feed: Feed?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }

    @IBAction func touchUpDismissButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setData() {
        guard let feed = self.feed else { return }
        self.videoImageView.image = UIImage(named: feed.videoImageName)
        self.titleLabel.text = feed.title
        self.descriptionLabel.text = feed.description
    }
}
