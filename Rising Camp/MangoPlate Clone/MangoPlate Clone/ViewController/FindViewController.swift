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
    
    // MARK: - object & var
    @IBOutlet weak var mainCollectionView: UICollectionView!
    var nowCellNum: Int? = nil
    
    var restaurantName: String = ""
    var restaurantAddress: String = ""
    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DEBUG: Find view did load")
        // CollectionView Delegate 설정
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        // Custom CollectionView Cell 적용
        mainCollectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "CustomCollectionViewCell")
    }
    // MARK: - Function
    // API Response Success
    func didSuccess(_ response: RestaurantResponse) {
        let data = response.response.body.items.item
        
        restaurantName = data.bsnNm
        restaurantAddress = data.roadNmAddr
    }
}

// MARK: - CollectionView
extension FindViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 500
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as? CustomCollectionViewCell
        else { return UICollectionViewCell() }

        DispatchQueue.global().sync {
            // API 요청
            print("call API")
            RestaurantRequest().getRestaurantData(VC: self, pageNo: indexPath.row)
        }
        
        print("set custom cell layout")
        cell.numAndRestaurantNameLabel.text = "\(indexPath.row + 1). \(self.restaurantName)"
        cell.addressLabel.text = self.restaurantAddress
        cell.backgroundColor = .darkGray
    
        return cell
    }
}
