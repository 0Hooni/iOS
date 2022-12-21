//
//  OrderListViewController.swift
//  CoupangEats Clone
//
//  Created by 송영훈 on 2022/12/13.
//

import UIKit
import Alamofire

class OrderListViewController: UIViewController {
    
    // MARK: - var & object
    @IBOutlet weak var orderListTableView: UITableView!
    var data: [OrderListResponseResult]! = nil
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DEBUG: Order list view did load")
        orderListTableView.delegate = self
        orderListTableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getUserOrderList()
        // 뷰에서 네비게이션바 숨기기
        navigationController?.setNavigationBarHidden(true, animated: animated)
        // 즐겨찾기 뷰 푸쉬를 위한 Noti observe
        NotificationCenter.default.addObserver(self, selector: #selector(pushFavoriteView), name: .pushFavoriteView, object: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 다른 뷰에 네비게이션이 나올 수 있게 기존 네비바를 가린 설정을 제거
        navigationController?.setNavigationBarHidden(false, animated: animated)
        // 뷰를 떠날때 옵저버 제거
        NotificationCenter.default.removeObserver(self, name: .pushFavoriteView, object: nil)
    }
    
    // MARK: - @objc
    @objc func pushFavoriteView() {
        guard let favoVC = self.storyboard?.instantiateViewController(withIdentifier: "FavoriteViewController") as? FavoriteViewController
        else { return }
        
        self.navigationController?.pushViewController(favoVC, animated: true)
    }
}

// MARK: - Table view delegate
extension OrderListViewController: UITableViewDelegate {
    // MARK: Table view number of cell in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    // MARK: Table view cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 232
    }
    
}

// MARK: - Table view datasource
extension OrderListViewController: UITableViewDataSource {
    // MARK: Custom table view cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderListTableViewCell", for: indexPath) as? OrderListTableViewCell
        else { return UITableViewCell() }
        
        cell.contentView.layer.borderColor = UIColor.lightGray.cgColor
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.cornerRadius = 5
        
        
        
        let nowData = data[indexPath.row]

        cell.restaurantName.text = nowData.getOrderRes?.restName
        
        let dateString: String = (nowData.getOrderRes?.createDate)!
        let iso8601DateFormatter = ISO8601DateFormatter()
        
        iso8601DateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds] // option형태의 포맷
        let date = iso8601DateFormatter.date(from: dateString)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd a hh:mm"
        cell.orderDate.text = dateFormatter.string(for: date!)
        
        
        cell.deliveryState.text = nowData.getOrderRes?.status
        cell.restaurantImageView.load(url: (nowData.getOrderRes?.restImagePath)!)
        let currentScore = nowData.getOrderRes?.score!
//
        cell.starImageView0.tintColor = 0 < currentScore! ? .systemYellow : .clear
        cell.starImageView1.tintColor = 1 < currentScore! ? .systemYellow : .clear
        cell.starImageView2.tintColor = 2 < currentScore! ? .systemYellow : .clear
        cell.starImageView3.tintColor = 3 < currentScore! ? .systemYellow : .clear
        cell.starImageView4.tintColor = 4 < currentScore! ? .systemYellow : .clear
//
        cell.menuNameLabel.text = nowData.orderMenuList?[0].menuName
        cell.orderTotalPrice.text = "\(numberFormatter(number: (nowData  .orderMenuList?[0].price!)!))원"
        
        return cell
    }
}

// MARK: - Alamofire
extension OrderListViewController {
    func getUserOrderList() {
        let userIdx = UserDefaults.standard.value(forKey: "userIdx")!
        let userJWT = UserDefaults.standard.value(forKey: "jwt")!
        let url = "http://13.124.84.127/app/orders/users/\(userIdx)"
        let header : HTTPHeaders = [
            "Content-Type" : "application/json",
            "X-ACCESS-TOKEN" : "\(userJWT)"
        ]
        AF.request( url, // [주소]
                    method: .get, // [전송 타입]
                    encoding: JSONEncoding.default, // [인코딩 스타일]
                    headers: header // [헤더 지정]
        ).responseDecodable(of: OrderListResponse.self) {
            response in
            switch response.result {
            case .success(let res):
                if res.isSuccess == true{
                    print("DEBUG: Get user order list success")
                    self.data = res.result
                    self.orderListTableView.reloadData()
                }
                else {
                    print("DEBUG: Get user order list fail")
                }
            case .failure(let err):
                print("DEBUG: Get user order list response error!")
                print(err.errorDescription!)
            }
        }
    }
}
