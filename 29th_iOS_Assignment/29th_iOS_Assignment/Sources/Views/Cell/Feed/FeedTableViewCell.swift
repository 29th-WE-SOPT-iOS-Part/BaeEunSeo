//
//  FeedTableViewCell.swift
//  29th_iOS_Assignment
//
//  Created by 배은서 on 2021/10/29.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    static let identifier: String = "FeedTableViewCell"

    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var morebutton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(feedData: Feed) {
        videoImageView.image = feedData.makeVideoImage()
        profileButton.setImage(feedData.makeProfileImage(), for: .normal)
        titleLabel.text = feedData.title
        descriptionLabel.text = feedData.description
    }
}
