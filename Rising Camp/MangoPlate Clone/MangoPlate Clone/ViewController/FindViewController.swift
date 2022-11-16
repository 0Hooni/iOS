//
//  ViewController.swift
//  MangoPlate Clone
//
//  Created by 송영훈 on 2022/11/15.
//

import UIKit
import Alamofire
import AFNetworking

class FindViewController: UIViewController {

//    @IBOutlet weak var RestaurantName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        RestaurantRequest().getRestaurantData(self)
    }
}

// MARK: - API
extension FindViewController {
    func didSuccess(_ response: RestaurantResponse) {
//        let data = response.response
        
//        self.RestaurantName.text = data.body.items.item.bsnNm
    }
}
