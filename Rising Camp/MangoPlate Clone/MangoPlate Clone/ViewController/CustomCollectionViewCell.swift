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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        print("DEBUG: Prepare for reuse")
        numAndRestaurantNameLabel.text = nil
        addressLabel.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
