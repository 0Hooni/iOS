//
//  PayViewController.swift
//  Starbucks FE Clone
//
//  Created by 송영훈 on 2022/10/25.
//

import UIKit

class PayViewController: UIViewController {

    @IBOutlet weak var cardPageView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        cardPageView.layer.shadowOpacity = 0.8
        cardPageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        cardPageView.layer.shadowRadius = 6
        
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
