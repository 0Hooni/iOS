//
//  OrderListTableViewCell.swift
//  CoupangEats Clone
//
//  Created by 송영훈 on 2022/12/15.
//

import UIKit

class OrderListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var orderDate: UILabel!
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var deliveryState: UILabel!
    
    @IBOutlet weak var starImageView0: UIImageView!
    @IBOutlet weak var starImageView1: UIImageView!
    @IBOutlet weak var starImageView2: UIImageView!
    @IBOutlet weak var starImageView3: UIImageView!
    @IBOutlet weak var starImageView4: UIImageView!
    
    @IBOutlet weak var menuNameLabel: UILabel!
    
    @IBOutlet weak var orderTotalPrice: UILabel!


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        restaurantName.text = nil
        orderDate.text = nil
        restaurantImageView.image = nil
        deliveryState.text = nil
        
        starImageView0.tintColor = .lightGray
        starImageView1.tintColor = .lightGray
        starImageView2.tintColor = .lightGray
        starImageView3.tintColor = .lightGray
        starImageView4.tintColor = .lightGray
        
        orderTotalPrice.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))
    }
}
