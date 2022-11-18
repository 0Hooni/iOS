//
//  CustomCollectionViewCell.swift
//  MangoPlate Clone
//
//  Created by 송영훈 on 2022/11/17.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var numAndRestaurantNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
