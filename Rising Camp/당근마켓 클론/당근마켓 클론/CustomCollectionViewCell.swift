//
//  CustomCollectionViewCell.swift
//  당근마켓 클론
//
//  Created by 송영훈 on 2022/11/03.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productThunbnail: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var Town_Time: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    @IBOutlet weak var chatCount: UILabel!
    @IBOutlet weak var attentionCount: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
