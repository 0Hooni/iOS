//
//  MyEatsViewController.swift
//  CoupangEats Clone
//
//  Created by 송영훈 on 2022/11/28.
//

import UIKit
import Alamofire

class MyEatsViewController: UIViewController {
    
    // MARK: - var & object
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userPhoneNumber: UILabel!
    @IBOutlet weak var detailViewButton: UIButton!
    
    @IBOutlet weak var userReviewCountLabel: UILabel!
    @IBOutlet weak var userWishCountLabel: UILabel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DEBUG: My eats view did load")
        // 자세히보기 버튼 테두리 주기
        detailViewButton.layer.borderWidth = 1.2
        detailViewButton.layer.borderColor = detailViewButton.tintColor.cgColor
        detailViewButton.layer.cornerRadius = 5
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UserDefaults.standard.value(forKey: "jwt") != nil {
            getUserInfo()
            getUserWishCount()
            getUserReviewCount()
        }
        else {
            self.tabBarController?.selectedIndex = 0
        }
        // 네비게이션 바 제거
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
    
    // MARK: - Function
    @IBAction func tapFavorite(_ senter: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "FavoriteViewController")
        else { return }
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func pushFavoriteView() {
        guard let favoVC = self.storyboard?.instantiateViewController(withIdentifier: "FavoriteViewController") as? FavoriteViewController
        else { return }
        
        self.navigationController?.pushViewController(favoVC, animated: true)
    }
}

// MARK: - Alamofire
extension MyEatsViewController {
    // MARK: Get user info
    func getUserInfo() {
        print("DEBUG: Set user info")
        
        let userIdx = UserDefaults.standard.value(forKey: "userIdx")
        let url = "http://13.124.84.127/app/users/\(userIdx as? Int ?? 0)"
        let header : HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        AF.request( url, // [주소]
                    method: .get, // [전송 타입]
                    encoding: JSONEncoding.default, // [인코딩 스타일]
                    headers: header // [헤더 지정]
        ).responseDecodable(of: UserInfoResponse.self) {
            response in
            switch response.result {
            case .success(let res):
                if res.isSuccess == true{
                    print("DEBUG: Get user info success")
                    self.userName.text = res.result?.name
                    self.userPhoneNumber.text = res.result?.phoneNumber
                }
                else {
                    print("DEBUG: Get user info fail")
                    self.userName.text = "사용자 이름"
                    self.userPhoneNumber.text = "010-0000-0000"
                }
            case .failure(let err):
                print("DEBUG: Get user info response error!")
                print(err.errorDescription!)
            }
        }
    }
    
    // MARK: Get user wish count
    func getUserWishCount() {
        let userIdx: Int = UserDefaults.standard.value(forKey: "userIdx") as! Int
        let url = "http://13.124.84.127/app/wishlists/users/\(userIdx)/count"
        let header : HTTPHeaders = [
            "Content-Type" : "application/json",
            "X-ACCESS-TOKEN" : "\(UserDefaults.standard.value(forKey: "jwt")!)"
        ]
        AF.request( url, // [주소]
                    method: .get, // [전송 타입]
                    encoding: JSONEncoding.default, // [인코딩 스타일]
                    headers: header // [헤더 지정]
        ).responseDecodable(of: CountResponse.self) {
            response in
            switch response.result {
            case .success(let res):
                if res.isSuccess == true{
                    print("DEBUG: Get user wish count success")
                    self.userWishCountLabel.text = "\(res.result!)"
                }
                else {
                    print("DEBUG: Get user wish count fail - \(res.code!)")
                }
            case .failure(let err):
                print("DEBUG: Get user wish count response error!")
                print(err.errorDescription!)
            }
        }
    }
    // MARK: Get user review count
    func getUserReviewCount() {
        print("DEBUG: Set user wish count")
        
        let userIdx: Int = UserDefaults.standard.value(forKey: "userIdx") as! Int
        let url = "http://13.124.84.127/app/reviews/users/\(userIdx)/count"
        let header : HTTPHeaders = [
            "Content-Type" : "application/json",
            "X-ACCESS-TOKEN" : "\(UserDefaults.standard.value(forKey: "jwt")!)"
        ]
        AF.request( url, // [주소]
                    method: .get, // [전송 타입]
                    encoding: JSONEncoding.default, // [인코딩 스타일]
                    headers: header // [헤더 지정]
        ).responseDecodable(of: CountResponse.self) {
            response in
            switch response.result {
            case .success(let res):
                if res.isSuccess == true{
                    print("DEBUG: Get user review count success!")
                    self.userReviewCountLabel.text = "\(res.result!)"
                }
                else { print("DEBUG: Get error, CODE is \(res.code!)") }
                
            case .failure(let err):
                print("DEBUG: Response error! Here is Description - \(err.errorDescription!)")
            }
        }
    }
}
