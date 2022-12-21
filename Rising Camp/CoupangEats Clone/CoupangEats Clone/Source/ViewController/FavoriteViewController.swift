//
//  FavoriteViewController.swift
//  CoupangEats Clone
//
//  Created by 송영훈 on 2022/11/28.
//

import UIKit
import Alamofire

class FavoriteViewController: UIViewController {
    
    // MARK: - var & objc
    @IBOutlet weak var favoriteTableView: UITableView!
    var data: FavoriteResponse! = nil
    
    // MARK: - Life cycle
    // MARK: View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DEBUG: Favorite view did load")
        favoriteTableView.delegate = self
        favoriteTableView.dataSource = self
        customBackBtn()
        favoriteTableView.rowHeight = 128
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavoriteRestaurantRequest()
    }
    // MARK: - Function
    func customBackBtn() {
        let backbutton = UIBarButtonItem(image: UIImage(named: "CoupangEats_Arrow_back"), style: .done, target: self, action: #selector(back))
        backbutton.tintColor = .black
        
        self.navigationItem.leftBarButtonItem = backbutton
        
        // back 버튼 제거시 사라지는 스와이프 제스처 살리기
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    // MARK: - @objc
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Table view delegate
extension FavoriteViewController: UITableViewDelegate {
    // MARK: Section header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    // MARK: Table view cell number
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.result?.count ?? 0
    }
}

// MARK: - Table view datasource
extension FavoriteViewController: UITableViewDataSource {
    // MARK: Section header custom
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        
        let totalCountLabel = UILabel()
        totalCountLabel.frame = CGRect(x: 16,
                                       y: 0,
                                       width: headerView.frame.width*0.6,
                                       height: headerView.frame.height)
        totalCountLabel.text = "총 \(tableView.numberOfRows(inSection: 0))개"
        totalCountLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        headerView.layer.shadowColor = UIColor.black.cgColor
        headerView.layer.shadowOpacity = 0.2
        headerView.layer.shadowOffset = CGSize(width: 0, height: 2.8)
        headerView.layer.shadowRadius = 1.8
        
        headerView.addSubview(totalCountLabel)
        headerView.backgroundColor = .white
        return headerView
    }
    // MARK: Cell custom
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriceTableViewCell", for: indexPath) as! FavoriceTableViewCell
        let nowData = data.result![indexPath.row]
        
        let url = nowData.restImagePath!
        cell.cellImageView.load(url: url)
        cell.cellNamelLabel.text = nowData.restName
        
        let score = String(format: "%.1f", nowData.restScore!)
        cell.cellScoreLabel.text = "\(score)(25)"
        
        let distance = String(format: "%.1f", nowData.restDistance!)
        let time = "\(nowData.restDeliveryTime! - 5)~\(nowData.restDeliveryTime! + 5)분"
        let tip = "배달비 \(nowData.restDeliveryTip!)원"
        cell.cellDeliveryDistanceTimePriceLabel.text
        = "\(distance)km • \(time) • \(tip)"
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "RestaurantDetailViewController") as? RestaurantDetailViewController
        else { return }
        
        nextVC.nowRestaurantIdx = self.data.result![indexPath.row].restIdx!
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

// MARK: - Alamofire
extension FavoriteViewController {
    func getFavoriteRestaurantRequest() {
        let userIndex = UserDefaults.standard.value(forKey: "userIdx") as! Int
        let url = "http://13.124.84.127/app/wishlists/users/\(userIndex)"
        let header : HTTPHeaders = [
            "Content-Type" : "application/json",
            "X-ACCESS-TOKEN" : "\(UserDefaults.standard.value(forKey: "jwt")!)"
        ]
        
        AF.request( url, // [주소]
                    method: .get, // [전송 타입]
                    encoding: JSONEncoding.default, // [인코딩 스타일]
                    headers: header // [헤더 지정]
        ).responseDecodable(of: FavoriteResponse.self) {
            response in
            switch response.result {
            case .success(let res):
                if res.isSuccess == true {
                    print("DEBUG: Get user favorite data success")
                    self.data = res
                    self.favoriteTableView.reloadData()
                    
                    var favoriteArray: [Int] = []
                    var favoriteRestArray: [Int] = []
                    let count = res.result?.count as Int?
                    for i in 0..<count! {
                        favoriteArray.append(res.result![i].wishIdx!)
                        favoriteRestArray.append(res.result![i].restIdx!)
                    }
                    UserDefaults.standard.setValue(favoriteArray, forKey: "favoriteArray")
                    UserDefaults.standard.setValue(favoriteRestArray, forKey: "favoriteRestArray")
                    UserDefaults.standard.synchronize()
                }
                else { print("DEBUG: Get error, CODE is \(res.code!)") }
            case .failure(let err):
                print("DEBUG: Response error! Here is Description - \(err.errorDescription!)")
            }
            
        }
    }
}
