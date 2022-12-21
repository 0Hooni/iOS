//
//  FavoriceTableViewCell.swift
//  CoupangEats Clone
//
//  Created by 송영훈 on 2022/11/29.
//

import UIKit

class FavoriceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellNamelLabel: UILabel!
    @IBOutlet weak var cellScoreLabel: UILabel!
    @IBOutlet weak var cellDeliveryDistanceTimePriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        cellImageView.image = nil
        cellNamelLabel.text = nil
        cellScoreLabel.text = nil
        cellDeliveryDistanceTimePriceLabel.text = nil
    }

}
