//
//  CategoryCollectionViewCell.swift
//  CoupangEats Clone
//
//  Created by 송영훈 on 2022/11/28.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        categoryImageView.image = nil
        categoryLabel.text = nil
    }
}
