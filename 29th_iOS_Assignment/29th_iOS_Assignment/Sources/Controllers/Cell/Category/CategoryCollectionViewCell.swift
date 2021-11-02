//
//  CategoryCollectionViewCell.swift
//  29th_iOS_Assignment
//
//  Created by 배은서 on 2021/10/29.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "CategoryCollectionViewCell"

    @IBOutlet weak var categoryButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setButtonShape()
    }
    
    private func setButtonShape() {
        categoryButton.layer.cornerRadius = 16
        categoryButton.layer.borderWidth = 1
        categoryButton.layer.borderColor = UIColor.systemGray4.cgColor
    }
    
    func setData(categoryData: Category) {
        categoryButton.setTitle(categoryData.name, for: .normal)
    }
}
