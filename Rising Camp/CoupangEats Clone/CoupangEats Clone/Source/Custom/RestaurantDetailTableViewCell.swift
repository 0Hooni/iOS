//
//  RestaurantDetailTableViewCell.swift
//  CoupangEats Clone
//
//  Created by 송영훈 on 2022/12/09.
//

import UIKit

class RestaurantDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var menuNameLabel: UILabel!
    @IBOutlet weak var menuPriceLabel: UILabel!
    @IBOutlet weak var menuContentLabel: UILabel!
    @IBOutlet weak var menuImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        menuNameLabel.text = nil
        menuPriceLabel.text = nil
        menuContentLabel.text = nil
        menuImageView.image = nil
    }
}
