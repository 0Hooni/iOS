//
//  RCMDListViewController.swift
//  Starbucks FE Clone
//
//  Created by 송영훈 on 2022/10/27.
//

import UIKit

class RCMDListViewController: UIViewController {
    
    
    @IBOutlet weak var ICCAImage: UIImageView!
    @IBOutlet weak var KRcoffeeName: UILabel!
    @IBOutlet weak var ENcoffeeName: UILabel!
    @IBOutlet weak var coffeePrice: UILabel!
    
    
    @IBOutlet weak var CAFAImage: UIImageView!
    @IBOutlet weak var IBGLImage: UIImageView!
    @IBOutlet weak var IHBTImage: UIImageView!
    @IBOutlet weak var CLDBImage: UIImageView!
    @IBOutlet weak var CAFLImage: UIImageView!
    @IBOutlet weak var ICFLImage: UIImageView!
    @IBOutlet weak var HCHPImage: UIImageView!
    @IBOutlet weak var HMYTImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.tintColor = .lightGray
        self.navigationController?.navigationBar.topItem?.title = ""
        
        
        ICCAImage.layer.cornerRadius = ICCAImage.frame.height/2
        ICCAImage.layer.borderWidth = 1
        ICCAImage.clipsToBounds = true
        ICCAImage.layer.borderColor = UIColor.clear.cgColor
        
        CAFAImage.layer.cornerRadius = CAFAImage.frame.height/2
        CAFAImage.layer.borderWidth = 1
        CAFAImage.clipsToBounds = true
        CAFAImage.layer.borderColor = UIColor.clear.cgColor
        
        IBGLImage.layer.cornerRadius = IBGLImage.frame.height/2
        IBGLImage.layer.borderWidth = 1
        IBGLImage.clipsToBounds = true
        IBGLImage.layer.borderColor = UIColor.clear.cgColor
        
        IHBTImage.layer.cornerRadius = IHBTImage.frame.height/2
        IHBTImage.layer.borderWidth = 1
        IHBTImage.clipsToBounds = true
        IHBTImage.layer.borderColor = UIColor.clear.cgColor
        
        CLDBImage.layer.cornerRadius = CLDBImage.frame.height/2
        CLDBImage.layer.borderWidth = 1
        CLDBImage.clipsToBounds = true
        CLDBImage.layer.borderColor = UIColor.clear.cgColor
        
        CAFLImage.layer.cornerRadius = CAFLImage.frame.height/2
        CAFLImage.layer.borderWidth = 1
        CAFLImage.clipsToBounds = true
        CAFLImage.layer.borderColor = UIColor.clear.cgColor
        
        ICFLImage.layer.cornerRadius = ICFLImage.frame.height/2
        ICFLImage.layer.borderWidth = 1
        ICFLImage.clipsToBounds = true
        ICFLImage.layer.borderColor = UIColor.clear.cgColor
        
        HCHPImage.layer.cornerRadius = HCHPImage.frame.height/2
        HCHPImage.layer.borderWidth = 1
        HCHPImage.clipsToBounds = true
        HCHPImage.layer.borderColor = UIColor.clear.cgColor
        
        HMYTImage.layer.cornerRadius = HMYTImage.frame.height/2
        HMYTImage.layer.borderWidth = 1
        HMYTImage.clipsToBounds = true
        HMYTImage.layer.borderColor = UIColor.clear.cgColor
    }
    
    @IBAction func sendData(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "DetailInfoViewController") as? DetailInfoViewController else {
                return
            }
            
        vc.mainImage = ICCAImage.image
        vc.KRCoffeeName = self.KRcoffeeName.text
        vc.ENCoffeeName = self.ENcoffeeName.text
        vc.CoffeePrice = self.coffeePrice.text
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "추천"
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
