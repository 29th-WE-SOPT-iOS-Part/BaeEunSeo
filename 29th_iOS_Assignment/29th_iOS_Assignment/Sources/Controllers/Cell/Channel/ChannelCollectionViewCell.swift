//
//  ChannelCollectionViewCell.swift
//  29th_iOS_Assignment
//
//  Created by 배은서 on 2021/10/29.
//

import UIKit

class ChannelCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "ChannelCollectionViewCell"

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setData(channelData: Channel) {
        profileImageView.image = channelData.makeProfileImage()
        nameLabel.text = channelData.channelName
    }
}
