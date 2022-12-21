//
//  SearchViewController.swift
//  CoupangEats Clone
//
//  Created by 송영훈 on 2022/11/28.
//

import UIKit
import Alamofire

class SearchViewController: UIViewController {

    // MARK: - var & object
    @IBOutlet weak var topSearchLabel1: UILabel!
    @IBOutlet weak var topSearchLabel2: UILabel!
    @IBOutlet weak var topSearchLabel3: UILabel!
    @IBOutlet weak var topSearchLabel4: UILabel!
    @IBOutlet weak var topSearchLabel5: UILabel!
    @IBOutlet weak var topSearchLabel6: UILabel!
    @IBOutlet weak var topSearchLabel7: UILabel!
    @IBOutlet weak var topSearchLabel8: UILabel!
    @IBOutlet weak var topSearchLabel9: UILabel!
    @IBOutlet weak var topSearchLabel10: UILabel!
    
    // MARK: - View cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DEBUG: Search view did load")
        getSearchTopTenRequest()
        customNavigationBackBtn()
        
        // 중앙 검색바 설정
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.placeholder = "검색어를 입력하세요"
        self.navigationItem.titleView = searchBar

    }
    
    // MARK: - Function
    func customNavigationBackBtn() {
        // Back buttom custom
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

// MARK: - Search delegate
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchResultViewController") as? SearchResultViewController
        else { return }

        // 검색어 이름 전달
        nextVC.nowSearchKeyword = searchBar.text!
        nextVC.isCallByCategory = false
        nextVC.isCallByKeywordSearch = true
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

// MARK: - Alamofire
extension SearchViewController {
    func getSearchTopTenRequest() {
        let url = "https://simplewrite.shop/app/searches/top-ten"
        
        let header : HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        AF.request( url, // [주소]
                    method: .get, // [전송 타입]
                    encoding: JSONEncoding.default, // [인코딩 스타일]
                    headers: header // [헤더 지정]
        ).responseDecodable(of: TopTenSearchResponse.self) {
            response in
            switch response.result {
            case .success(let res):
                if res.isSuccess == true{
                    print("DEBUG: Get search top ten success")
                    self.topSearchLabel1.text = res.result[0].word
                    self.topSearchLabel2.text = res.result[1].word
                    self.topSearchLabel3.text = res.result[2].word
                    self.topSearchLabel4.text = res.result[3].word
                    self.topSearchLabel5.text = res.result[4].word
                    self.topSearchLabel6.text = res.result[5].word
                    self.topSearchLabel7.text = res.result[6].word
                    self.topSearchLabel8.text = res.result[7].word
                    self.topSearchLabel9.text = res.result[8].word
                    self.topSearchLabel10.text = res.result[9].word
                    
                    print(res.result.count)
                }
                else { print("DEBUG: Get error, CODE is \(res.code)") }
            case .failure(let err):
                print("DEBUG: Response error! Here is Description - \(err.errorDescription)")
            }
        }
    }
}
