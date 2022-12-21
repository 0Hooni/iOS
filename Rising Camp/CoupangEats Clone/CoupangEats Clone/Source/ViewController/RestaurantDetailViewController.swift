//
//  RestaurantDetailViewController.swift
//  CoupangEats Clone
//
//  Created by 송영훈 on 2022/12/08.
//

import UIKit
import Alamofire

class RestaurantDetailViewController: UIViewController {
    
    var nowRestaurantIdx: Int = 0
    var data: [RestaurantMenuResponseResult]!
    
    var userFavoriteArray = UserDefaults.standard.value(forKey: "favoriteArray") as? [Int] ?? []
    var userFavoriteRestArray = UserDefaults.standard.value(forKey: "favoriteRestArray") as? [Int] ?? []
    
    @IBOutlet weak var restaurantDetailTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantDetailTableView.delegate = self
        restaurantDetailTableView.dataSource = self
        
        print("DEBUG: Restaurant detail view did load")
        print("DEBUG: Restaurant Index - \(nowRestaurantIdx)")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customNavigationBackBtn()
        setNaviRightBtn()
        getRestaurantMenuRequest(restIdx: nowRestaurantIdx)
    }
    
    
    // MARK: - Function
    // MARK: Custom navi back button
    func customNavigationBackBtn() {
        // Back buttom custom
        let backbutton = UIBarButtonItem(image: UIImage(named: "CoupangEats_Arrow_back"), style: .done, target: self, action: #selector(back))
        backbutton.tintColor = .black
        self.navigationItem.leftBarButtonItem = backbutton
        // back 버튼 제거시 사라지는 스와이프 제스처 살리기
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    // MARK: Custom navi right item
    func setNaviRightBtn() {
        let bookmarkBtn: UIButton = UIButton(type: UIButton.ButtonType.custom)
        // 찜이 되어있는지 확인
        if self.userFavoriteRestArray.contains(nowRestaurantIdx) {
            bookmarkBtn.setImage(UIImage(systemName: "heart.fill"), for: [])
        }
        else {
            bookmarkBtn.setImage(UIImage(systemName: "heart"), for: [])
        }
        bookmarkBtn.tintColor = .systemRed
        bookmarkBtn.addTarget(self, action: #selector(self.bookmarkBtnClicked(_:)), for: UIControl.Event.touchUpInside)
        bookmarkBtn.frame = CGRect(x: 0, y: 0, width: 36, height: 48)
        
        let searchButton = UIBarButtonItem(customView: bookmarkBtn)
        
        let shareBtn: UIButton = UIButton(type: UIButton.ButtonType.custom)
        shareBtn.setImage(UIImage(systemName: "square.and.arrow.up"), for: [])
        shareBtn.tintColor = .black
        shareBtn.addTarget(self, action: #selector(self.shareBtnClicked(_:)), for: UIControl.Event.touchUpInside)
        shareBtn.frame = CGRect(x: 0, y: 0, width: 36, height: 48)
        let bellButton = UIBarButtonItem(customView: shareBtn)
        
        self.navigationItem.rightBarButtonItems = [searchButton, bellButton]
    }
    // MARK: - @objc
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func bookmarkBtnClicked(_ sender: Any) {
        // 찜이 되어있을 때 -> 찜 해제
        if self.userFavoriteRestArray.contains(nowRestaurantIdx) {
            let currentIndex = userFavoriteRestArray.firstIndex(of: nowRestaurantIdx)!
            print("DEBUG:", userFavoriteArray[currentIndex])
            patchWishlistRequest(wishIndex: userFavoriteArray[currentIndex])
            
            userFavoriteArray.remove(at: currentIndex)
            userFavoriteRestArray.remove(at: currentIndex)
            
            UserDefaults.standard.set(userFavoriteArray, forKey: "favoriteArray")
            UserDefaults.standard.set(userFavoriteRestArray, forKey: "favoriteRestArray")
            UserDefaults.standard.synchronize()
            
            print("DEBUG: Remove this restaurant from favorite list")
        }
        // 찜이 안되어 있을때 -> 찜 추가
        else {
            // 서버쪽 오류가 있어서 추가가 안됨
            print("DEBUG: Add this restaurant to favorite list")
        }
    }
    @objc func shareBtnClicked(_ sender: Any) {
        
    }
}

// MARK: - Table view delegate
extension RestaurantDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}

// MARK: - Table view datasource
extension RestaurantDetailViewController: UITableViewDataSource {
    // MARK: Set Table view cell data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantDetailTableViewCell", for: indexPath) as! RestaurantDetailTableViewCell
        let nowData = data[indexPath.row]
        
        
        cell.menuNameLabel.text = nowData.name
        cell.menuPriceLabel.text = "\(numberFormatter(number: nowData.price!))원"
        cell.menuContentLabel.text = nowData.content
        cell.menuImageView.load(url: nowData.menuImage!)
        
        return cell
    }
    // MARK: Table view cell did selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "MenuDetailViewController") as? MenuDetailViewController
        else { return }
        let nowData = self.data[indexPath.row]
        nextVC.menuImageURL = nowData.menuImage
        nextVC.menuName = nowData.name
        nextVC.menuComent = nowData.content
        nextVC.menuPrice = nowData.price
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}   

// MARK: - Alamofire
extension RestaurantDetailViewController {
    // MARK: Get restaurant menu
    func getRestaurantMenuRequest(restIdx: Int) {
        let url = "https://simplewrite.shop/app/menus/res-id/\(nowRestaurantIdx)"
        
        let header : HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        AF.request( url, // [주소]
                    method: .get, // [전송 타입]
                    encoding: JSONEncoding.default, // [인코딩 스타일]
                    headers: header // [헤더 지정]
        ).responseDecodable(of: RestaurantMenuResponse.self) {
            response in
            switch response.result {
            case .success(let res):
                if res.isSuccess == true{
                    print("DEBUG: Get restaurant menu success")
                    self.data = res.result
                    self.restaurantDetailTableView.reloadData()
                }
                else { print("DEBUG: Get error, CODE is \(res.code!)") }
            case .failure(let err):
                print("DEBUG: Response error! Here is Description - \(err.errorDescription!)")
            }
        }
    }
    func patchWishlistRequest(wishIndex: Int) {
        let url = "https://simplewrite.shop/app/wishlists/\(wishIndex)/d"
        let header : HTTPHeaders = [
            "Content-Type" : "application/json",
            "X-ACCESS-TOKEN" : "\(UserDefaults.standard.value(forKey: "jwt")!)"
        ]
        AF.request( url, // [주소]
                    method: .patch, // [전송 타입]
                    encoding: JSONEncoding.default, // [인코딩 스타일]
                    headers: header // [헤더 지정]
        ).responseDecodable(of: CountResponse.self) {
            response in
            switch response.result {
            case .success(let res):
                if res.isSuccess == true{
                    print("DEBUG: Patch wish list success!")
                    print("DEBUG: Deleted wish index is \(res.result!)")
                }
                else {
                    print("DEBUG: Patch error, CODE is \(res.code!)")
                }
            case .failure(let err):
                print("DEBUG: Response error! Here is Description - \(err.errorDescription!)")
            }
        }
    }
}
