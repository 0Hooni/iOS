//
//  HeaderTabbarCollectionViewCell.swift
//  CoupangEats Clone
//
//  Created by 송영훈 on 2022/12/13.
//

import UIKit

class HeaderTabbarCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var tabLabel: UILabel!
    @IBOutlet weak var tabIsSelectedView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func prepareForReuse() {
        tabLabel.text = nil
        tabIsSelectedView.backgroundColor = .clear
    }

}
