//
//  ProductDetailViewController.swift
//  당근마켓 클론
//
//  Created by 송영훈 on 2022/11/03.
//

import UIKit

class ProductDetailViewController: UIViewController, UIScrollViewDelegate {
    
    var target: productList! = nil
    
    @IBOutlet weak var productImage1: UIImageView!
    @IBOutlet weak var productImage2: UIImageView!

    @IBOutlet weak var sellerTown: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var category_timeGo: UILabel!
    @IBOutlet weak var chat_attention_view: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem?.tintColor = .black
        // Do any additional setup after loading the view.
        productImage1.image = UIImage(named: "\(target.productName)_1")
        productImage2.image = UIImage(named: "\(target.productName)_2")
        sellerTown.text = target.town
        productName.text = target.productName
        category_timeGo.text = "전자기기 • \(target.timeGo)"
        chat_attention_view.text = "문의 \(target.chatCount) • 관심 \(target.attentionCount) • 조회 13"
    }
}
