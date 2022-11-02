//
//  HomeCustomCollectionViewCell.swift
//  당근마켓 클론
//
//  Created by 송영훈 on 2022/11/01.
//

import UIKit

class HomeCustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productThumbnail: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var sellerTown: UILabel!
    @IBOutlet weak var uploadTimeGo: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    @IBOutlet weak var chatCount: UILabel!
    @IBOutlet weak var attentionCount: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
