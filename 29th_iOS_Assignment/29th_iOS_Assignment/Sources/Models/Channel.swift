//
//  Channel.swift
//  29th_iOS_Assignment
//
//  Created by 배은서 on 2021/10/29.
//

import UIKit

struct Channel {
    var profileImageName: String
    var channelName: String
    
    func makeProfileImage() -> UIImage? {
        return UIImage(named: profileImageName)
    }
}
