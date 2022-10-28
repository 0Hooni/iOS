//
//  DetailInfoViewController.swift
//  Starbucks FE Clone
//
//  Created by 송영훈 on 2022/10/28.
//

import UIKit

class PaddingLabel: UILabel {
    @IBInspectable var topInset: CGFloat = 4.0
    @IBInspectable var bottomInset: CGFloat = 4.0
    @IBInspectable var leftInset: CGFloat = 8.0
    @IBInspectable var rightInset: CGFloat = 8.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
}

class DetailInfoViewController: UIViewController {

    var mainImage: UIImage!
    var KRCoffeeName: String!
    var ENCoffeeName: String!
    var CoffeePrice: String!
    
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var mainCoffeeName: UILabel!
    @IBOutlet weak var subCoffeeName: UILabel!
    @IBOutlet weak var coffeePrice: UILabel!
    
    @IBOutlet weak var coffeeIngredient: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.tintColor = .lightGray
        self.navigationController?.navigationBar.topItem?.title = ""
        
        self.Image.image = mainImage
        self.mainCoffeeName.text = KRCoffeeName
        self.subCoffeeName.text = ENCoffeeName
        self.coffeePrice.text = CoffeePrice
        
        self.coffeeIngredient.text = "블론드/디카페인 커피 Tab에서\n블론드, 디카페인, 1/2디카페인 아메리카노를 주문할\n수 있습니다."
        
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
