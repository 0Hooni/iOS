//
//  OrderViewController.swift
//  Starbucks FE Clone
//
//  Created by 송영훈 on 2022/10/25.
//

import UIKit

class OrderViewController: UIViewController {
    
    @IBOutlet weak var RCMDCateImage: UIImageView!
    @IBOutlet weak var RSVECateImage: UIImageView!
    @IBOutlet weak var RSVDCateImage: UIImageView!
    @IBOutlet weak var RFRSCateImage: UIImageView!
    @IBOutlet weak var CLDBCateImage: UIImageView!
    @IBOutlet weak var BLNDCateImage: UIImageView!
    @IBOutlet weak var ESPRCateImage: UIImageView!
    @IBOutlet weak var DECFCateImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        RCMDCateImage.layer.cornerRadius = RCMDCateImage.frame.height/2
        RCMDCateImage.layer.borderWidth = 1
        RCMDCateImage.clipsToBounds = true
        RCMDCateImage.layer.borderColor = UIColor.clear.cgColor
        
        RSVECateImage.layer.cornerRadius = RSVECateImage.frame.height/2
        RSVECateImage.layer.borderWidth = 1
        RSVECateImage.clipsToBounds = true
        RSVECateImage.layer.borderColor = UIColor.clear.cgColor
        
        RSVDCateImage.layer.cornerRadius = RSVDCateImage.frame.height/2
        RSVDCateImage.layer.borderWidth = 1
        RSVDCateImage.clipsToBounds = true
        RSVDCateImage.layer.borderColor = UIColor.clear.cgColor
        
        RFRSCateImage.layer.cornerRadius = RFRSCateImage.frame.height/2
        RFRSCateImage.layer.borderWidth = 1
        RFRSCateImage.clipsToBounds = true
        RFRSCateImage.layer.borderColor = UIColor.clear.cgColor
        
        CLDBCateImage.layer.cornerRadius = CLDBCateImage.frame.height/2
        CLDBCateImage.layer.borderWidth = 1
        CLDBCateImage.clipsToBounds = true
        CLDBCateImage.layer.borderColor = UIColor.clear.cgColor
        
        BLNDCateImage.layer.cornerRadius = BLNDCateImage.frame.height/2
        BLNDCateImage.layer.borderWidth = 1
        BLNDCateImage.clipsToBounds = true
        BLNDCateImage.layer.borderColor = UIColor.clear.cgColor
        
        ESPRCateImage.layer.cornerRadius = ESPRCateImage.frame.height/2
        ESPRCateImage.layer.borderWidth = 1
        ESPRCateImage.clipsToBounds = true
        ESPRCateImage.layer.borderColor = UIColor.clear.cgColor
        
        DECFCateImage.layer.cornerRadius = DECFCateImage.frame.height/2
        DECFCateImage.layer.borderWidth = 1
        DECFCateImage.clipsToBounds = true
        DECFCateImage.layer.borderColor = UIColor.clear.cgColor
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Back 버튼 타이틀 제거시 이전 뷰의 타이틀이 없어져서 LifeCycle을 이용해서 해결
        self.navigationItem.title = "Order"
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
