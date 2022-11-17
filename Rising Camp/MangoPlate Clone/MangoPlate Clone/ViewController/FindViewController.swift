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
    
    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        RestaurantRequest().getRestaurantData(self)

        
    }
    
    // MARK: - Function
    func didSuccess(_ response: RestaurantResponse) {
        let data = response.response
        
//        self.RestaurantName.text = data.body.items.item.bsnNm
    }
}


// MARK: - Collection View
extension FindViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
