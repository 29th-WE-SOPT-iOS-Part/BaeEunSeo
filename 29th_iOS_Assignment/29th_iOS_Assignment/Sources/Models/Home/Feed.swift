//
//  Feed.swift
//  29th_iOS_Assignment
//
//  Created by 배은서 on 2021/10/29.
//

import UIKit

struct Feed {
    var videoImageName: String
    var profileImageName: String
    var title: String
    var description: String
    
    func makeVideoImage() -> UIImage? {
        return UIImage(named: videoImageName)
    }
    
    func makeProfileImage() -> UIImage? {
        return UIImage(named: profileImageName)
    }
}
