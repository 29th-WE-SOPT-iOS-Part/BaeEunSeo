//
//  FeedTableViewCell.swift
//  29th_iOS_Assignment
//
//  Created by 배은서 on 2021/10/29.
//

import UIKit
import Alamofire

class FeedTableViewCell: UITableViewCell {
    static let identifier: String = "FeedTableViewCell"

    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var morebutton: UIButton!
    
    var showFeedDetail: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setTapGesture()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setTapGesture() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapFeed))
        videoImageView.addGestureRecognizer(tapRecognizer)
        videoImageView.isUserInteractionEnabled = true
    }
    
    @objc func tapFeed() {
        print("taptap")
        showFeedDetail?()
    }
    
    func setData(feedData: Feed) {
        videoImageView.image = feedData.makeVideoImage()
        profileButton.setImage(feedData.makeProfileImage(), for: .normal)
        titleLabel.text = feedData.title
        descriptionLabel.text = feedData.description
    }
}
