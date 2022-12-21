//
//  HomeTableViewCell.swift
//  CoupangEats Clone
//
//  Created by 송영훈 on 2022/12/04.
//

import UIKit

class RestaurantListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var thumbnailImageView1: UIImageView!
    @IBOutlet weak var thumbnailImageView2: UIImageView!
    @IBOutlet weak var thumbnailImageView3: UIImageView!
    
    @IBOutlet weak var storeAvgScoreAndCount: UILabel!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var deliveryKm: UILabel!
    @IBOutlet weak var deliveryPrice: UILabel!
    @IBOutlet weak var deleveryTime: UILabel!
    
    var restaurantID: Int!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    // MARK: Cell 테두리 간격
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 16.0, left: 0, bottom: 0, right: 0))
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        thumbnailImageView1.image = nil
        thumbnailImageView2.image = nil
        thumbnailImageView3.image = nil

        storeAvgScoreAndCount.text = nil
        storeName.text = nil
        deliveryKm.text = nil
        deliveryPrice.text = nil
        deleveryTime.text = nil
        
        restaurantID = nil
    }
}
