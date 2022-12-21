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
    
    var mainData: RestaurantResponse?
    var nowPageNum = 1
    var nowRestaurantNum: Int?
    var restaurantName: String?
    var restaurantAddress: String?
    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DEBUG: Find view did load")
        DispatchQueue.global().sync {
            print("DEBUG: Request at first")
            RestaurantRequest().getRestaurantData(VC: self, pageNo: 1)
        }
        DispatchQueue.global().sync {
            print("DUBUG: Set Delegate")
            // CollectionView Delegate 설정
            mainCollectionView.delegate = self
            mainCollectionView.dataSource = self
            // Custom CollectionView Cell 적용
            mainCollectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "CustomCollectionViewCell")
        }
    }
    // MARK: - Function
    // API Response Success
    func didSuccess(_ response: RestaurantResponse) {
        mainData = response
    }
}

// MARK: - CollectionView
extension FindViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 400
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as? CustomCollectionViewCell
        else {
            print("DEBUG: Print basic cell")
            return UICollectionViewCell()
            
        }
        let queue1 = DispatchQueue(label: "queue1", attributes: .concurrent)
        let queue2 = DispatchQueue(label: "queue2", attributes: .concurrent)
        
        let group = DispatchGroup()
        queue1.async(group: group) {
            // API 요청
            print("DEBUG: call API in GCD")
            RestaurantRequest().getRestaurantData(VC: self, pageNo: self.nowPageNum)
        }
        queue2.async(group: group) {
            print("DEBUG: Set value from response")
            print("now Index : \(indexPath.item), now Name: \(self.mainData?.response.body.items.item[indexPath.item].bsnNm ?? "")")
            self.restaurantName = self.mainData?.response.body.items.item[indexPath.item].bsnNm
            self.restaurantAddress = self.mainData?.response.body.items.item[indexPath.item].roadNmAddr
            self.nowRestaurantNum = self.mainData?.response.body.items.item[indexPath.item].no
        }
        
        let queueForGroup = DispatchQueue(label: "queue3", attributes: .concurrent)
        group.notify(queue: queueForGroup) { // group이 끝난 후 후행 클로저를 실행할 queue삽입
            print("DEBUG: Set custom cell layout")
            DispatchQueue.main.async {
                cell.numAndRestaurantNameLabel.text = "\(indexPath.item + 1). \(self.restaurantName ?? "")"
                cell.addressLabel.text = self.restaurantAddress
            }
        }
        return cell
    }
}
