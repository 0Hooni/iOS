//
//  SearchResultViewController.swift
//  CoupangEats Clone
//
//  Created by 송영훈 on 2022/12/08.
//

import UIKit
import Alamofire

class SearchResultViewController: UIViewController {

    var nowCategoryName: String = ""
    var isCallByCategory: Bool = false
    var nowSearchKeyword: String = ""
    var isCallByKeywordSearch: Bool = false
    var data: RestaurantResponse! = nil
    @IBOutlet weak var resultTableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DEBUG: Search result view did load")
        
        resultTableView.delegate = self
        resultTableView.dataSource = self
        
        customNavigation()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getRequest()
    }
    // MARK: - Function
    // MARK: Navigation custom
    func customNavigation() {
        let backbutton = UIBarButtonItem(image: UIImage(named: "CoupangEats_Arrow_back"),
                                         style: .done, target: self, action: #selector(back))
        backbutton.tintColor = .black
        self.navigationItem.leftBarButtonItem = backbutton
        // back 버튼 제거시 사라지는 스와이프 제스처 살리기
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        if self.isCallByCategory == true {
            self.navigationItem.title = nowCategoryName
        }
        else if self.isCallByKeywordSearch == true {
            self.navigationItem.title = nowSearchKeyword
        }
        
    }
    // MARK: - @objc
    // MARK: Back function
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Table view delegata & datasource
extension SearchResultViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: Number of row in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data?.result?.count ?? 0
    }
    // MARK: Height for row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 256
    }
    // MARK: Cell custom
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantListTableViewCell") as! RestaurantListTableViewCell
        
        let nowData = self.data.result![indexPath.row]
        cell.thumbnailImageView1.load(url: nowData.restaurantImage!)
        cell.thumbnailImageView2.load(url: nowData.restaurantImage1!)
        cell.thumbnailImageView3.load(url: nowData.restaurantImage2!)
        
        cell.storeName.text = nowData.name
        cell.deleveryTime.text = "\(nowData.timeDelivery! - 5)~\(nowData.timeDelivery! + 5) 분"

        let score = String(format: "%.1f", nowData.score!)
        cell.storeAvgScoreAndCount.text = "\(score)(197)"
        cell.deliveryKm.text = " • \(nowData.distance!)km"
        cell.deliveryPrice.text = " • 배달비 \(nowData.tipDelivery!)원"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nowRestID = self.data.result![indexPath.row].restaurantID
        
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "RestaurantDetailViewController") as? RestaurantDetailViewController
        else { return }
        nextVC.nowRestaurantIdx = nowRestID!
        
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
}

// MARK: - Alamofire
extension SearchResultViewController {
    func getRequest() {
        var url: String = ""
        var key: String = ""
        var value: String = ""
        
        if self.isCallByCategory == true {
            url = "https://simplewrite.shop/app/restaurants/category"
            key = "category"
            value = self.nowCategoryName
        }
        
        else if self.isCallByKeywordSearch == true {
            url = "https://simplewrite.shop/app/restaurants/name"
            key = "name"
            value = self.nowSearchKeyword
        }
        
        
        let header : HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let queryData : Parameters = [
            key : value
        ]
        
        AF.request( url, // [주소]
                    method: .get, // [전송 타입]
                    parameters: queryData, // [전송 데이터]
                    encoding: URLEncoding.queryString, // [인코딩 스타일]
                    headers: header // [헤더 지정]
        ).responseDecodable(of: RestaurantResponse.self) {
            response in
            switch response.result {
            case .success(let res):
                print("DEBUG: Response success!")
                if res.isSuccess == true {
                    self.data = res
                    self.resultTableView.reloadData()
                    
                }
                else { print("DEBUG: Get error, CODE is \(res.code!)") }
            case .failure(let err):
                print("DEBUG: Response error! Here is Description - \(err.errorDescription!)")
            }
            
        }
    }
}
