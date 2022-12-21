//
//  ViewController.swift
//  CoupangEats Clone
//
//  Created by 송영훈 on 2022/11/26.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {
    
    // MARK: - var & object
    @IBOutlet weak var homeTableView: UITableView!
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    let bannerImageSet = [UIImage(named: "CoupangEats_home_banner_1"),
                          UIImage(named: "CoupangEats_home_banner_2"),
                          UIImage(named: "CoupangEats_home_banner_3"),
                          UIImage(named: "CoupangEats_home_banner_4")]
    
    var nowBannerPageNum: Int = 0
    @IBOutlet weak var bannerPageLabel: UILabel!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var data: RestaurantResponse?
    var nowRestaurantReviewCount: Int = 0
   
    

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DEBUG: Home view did load")
        self.getRequest()
        
        setNaviRightBtn()
        self.navigationItem.title = "Coupang Eats"
        setTableView()
        setBannerCollectionView()
        // 인덱스 레이블 둥글게
        bannerPageLabel.layer.cornerRadius = 5
        setCategoryCollectionView()
        bannerTimer()
        
        // Section 간격 제거
        if #available(iOS 15, *) {
            homeTableView.sectionHeaderTopPadding = 0
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 즐겨찾기 뷰 푸쉬를 위한 Noti observe
        NotificationCenter.default.addObserver(self, selector: #selector(pushFavoriteView), name: .pushFavoriteView, object: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 뷰를 떠날때 옵저버 제거
        NotificationCenter.default.removeObserver(self, name: .pushFavoriteView, object: nil)
    }
    
    
    // MARK: - Function
    func callNextVC(VCName: String) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "\(VCName)ViewController") else { return }
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    // MARK: - Custom Navigation bar
    func setNaviRightBtn() {
        let searchBtn: UIButton = UIButton(type: UIButton.ButtonType.custom)
        searchBtn.setImage(UIImage(named: "CoupangEats_Search"), for: [])
        searchBtn.addTarget(self, action: #selector(self.searchBtnPressed(_:)), for: UIControl.Event.touchUpInside)
        searchBtn.frame = CGRect(x: 0, y: 0, width: 36, height: 44)
        let searchButton = UIBarButtonItem(customView: searchBtn)
        
        let bellBtn: UIButton = UIButton(type: UIButton.ButtonType.custom)
        bellBtn.setImage(UIImage(named: "CoupangEats_Bell"), for: [])
        bellBtn.addTarget(self, action: #selector(self.bellBtnPressed(_:)), for: UIControl.Event.touchUpInside)
        bellBtn.frame = CGRect(x: 0, y: 0, width: 36, height: 44)
        let bellButton = UIBarButtonItem(customView: bellBtn)
        
        self.navigationItem.rightBarButtonItems = [searchButton, bellButton]
    }
    // MARK: 메인 테이블뷰 호출시 기본 옵션 정리
    func setTableView() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
    // MARK: 배너 컬렉션뷰 호출시 기본 옵션 정리
    func setBannerCollectionView() {
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        
        bannerPageLabel.text
        = "\(nowBannerPageNum + 1) / \(bannerImageSet.count)"
    }
    // MARK: 카테고리 컬렉션뷰 호출 시 기본 옵션 정리
    func setCategoryCollectionView() {
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
    // MARK: 배너 이미지 관련
    // 일정 시간마다 배너 이동
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    // 배너 움직이는 매서드
    func bannerMove() {
        // 현재페이지가 마지막 페이지일 경우
        if nowBannerPageNum == bannerImageSet.count-1 {
            // 맨 처음 페이지로 돌아감
            bannerCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            nowBannerPageNum = 0
            bannerPageLabel.text = "\(nowBannerPageNum + 1) / \(bannerImageSet.count)"
            return
        }
        // 다음 페이지로 전환
        nowBannerPageNum += 1
        bannerPageLabel.text = "\(nowBannerPageNum + 1) / \(bannerImageSet.count)"
        bannerCollectionView.scrollToItem(at: NSIndexPath(item: nowBannerPageNum, section: 0) as IndexPath, at: .right, animated: true)
    }
    
    // MARK: - @objc
    @objc func searchBtnPressed(_ sender: Any) {
        callNextVC(VCName: "Search")
    }
    @objc func bellBtnPressed(_ sender: Any) {
        
    }
    @objc func pushFavoriteView() {
        guard let favoVC = self.storyboard?.instantiateViewController(withIdentifier: "FavoriteViewController") as? FavoriteViewController
        else { return }
        
        self.navigationController?.pushViewController(favoVC, animated: true)
    }
}

// MARK: - Home table view Delegate
extension HomeViewController: UITableViewDelegate {
    // MARK: Setting Section height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    // MARK: Number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.result?.count ?? 15
    }
    // MARK: Setting row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 256
    }
}

// MARK: - Home table view Datasource
extension HomeViewController: UITableViewDataSource {
    // MARK: section header custom
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let filterSectionView = UIView.init(frame: CGRect(x: 0, y: 0,
                                                          width: tableView.frame.width,
                                                          height: 40))
        let sectionLabel = UILabel.init(frame: CGRect(x: 8, y: 0,
                                                      width: tableView.frame.width,
                                                      height: filterSectionView.frame.height))
        sectionLabel.text = "골라먹는 맛집"
        sectionLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        filterSectionView.layer.shadowColor = UIColor.black.cgColor
        filterSectionView.layer.shadowOpacity = 0.2
        filterSectionView.layer.shadowOffset = CGSize(width: 0, height: 2.8)
        filterSectionView.layer.shadowRadius = 1.8
        
        filterSectionView.addSubview(sectionLabel)
        
        filterSectionView.backgroundColor = .white
        
        return filterSectionView
    }
    
    // MARK: Table view cell 데이터 커스텀
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantListTableViewCell", for: indexPath) as! RestaurantListTableViewCell
        
        let data = data?.result?[indexPath.row]
        print("DEBUG: \(indexPath.row)열, \(data?.name ?? "가게이름 없음")" )
        
        cell.thumbnailImageView1.load(url: data?.restaurantImage ?? "")
        cell.thumbnailImageView2.load(url:  data?.restaurantImage1 ?? "")
        cell.thumbnailImageView3.load(url: data?.restaurantImage2 ?? "")
        
        cell.storeName.text = data?.name
        cell.deleveryTime.text = "\((data?.timeDelivery ?? 30) - 5)~\((data?.timeDelivery ?? 30) + 5) 분"
        
        let score = String(format: "%.1f", data?.score ?? 5.0)
        
        self.getRestaurantReviewCountRequest(restIdx: data?.restaurantID ?? 0)
        cell.storeAvgScoreAndCount.text = "\(score)(\(self.nowRestaurantReviewCount))"
        
        cell.deliveryKm.text = " • \(data?.distance ?? 1.0)km"
        cell.deliveryPrice.text = " • 배달비 \(data?.tipDelivery ?? "3000")원"
        
        return cell
    }
    
    // MARK: Table view cell did selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("DEBUG: \(indexPath.row)")
        print("DEBUG: \(data?.result?[indexPath.row].restaurantID ?? 45)")
        print("DEBUG: \(data?.result?[indexPath.row].name ?? "")")
        
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "RestaurantDetailViewController") as? RestaurantDetailViewController
        else { return }
        
        nextVC.nowRestaurantIdx = data?.result?[indexPath.row].restaurantID ?? 0
        nextVC.navigationItem.title = data?.result?[indexPath.row].name ?? ""
        
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

// MARK: - Collection view delegate & datasource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // MARK: Collection view cell 갯수 지정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == bannerCollectionView {
            return bannerImageSet.count
        }
        else {
            return categoryName.count
        }
        
    }
    // MARK: Collection view cell custom
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == bannerCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as! BannerCollectionViewCell
            cell.bannerImageView.image = bannerImageSet[indexPath.row]
            
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
            cell.categoryImageView.image = categoryImage[indexPath.item]
            cell.categoryLabel.text = categoryName[indexPath.item]
            
            return cell
        }
    }
    // MARK: 컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == bannerCollectionView {
            return CGSize(width: collectionView.frame.width,
                          height:  collectionView.frame.height)
        }
        else {
            return CGSize(width: collectionView.frame.width/5,
                          height: collectionView.frame.height)
        }
        
    }
    // MARK: Collection view cell did select
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchResultViewController") as? SearchResultViewController
            else { return }
            
            // 카테고리 이름 전달
            nextVC.nowCategoryName = categoryName[indexPath.item]
            nextVC.isCallByCategory = true
            nextVC.isCallByKeywordSearch = false
            
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
    // MARK: 컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == bannerCollectionView {
            nowBannerPageNum = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
            bannerPageLabel.text = "\(nowBannerPageNum + 1) / \(bannerImageSet.count)"
        }
    }
    
}

// MARK: - Alamofire
extension HomeViewController {
    // MARK: Get all restaurant data
    func getRequest() {
        let url = "https://simplewrite.shop/app/restaurants/list"
        
        let header : HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        AF.request( url, // [주소]
                    method: .get, // [전송 타입]
                    encoding: JSONEncoding.default, // [인코딩 스타일]
                    headers: header // [헤더 지정]
        ).responseDecodable(of: RestaurantResponse.self) {
            response in
            switch response.result {
            case .success(let res):
                print("DEBUG: Get restaurant response success!")
                if res.isSuccess == true{
                    self.data = res
                    self.homeTableView.reloadData()
                }
                else { print("DEBUG: Get error, CODE is \(res.code!)") }
            case .failure(let err):
                print("DEBUG: Response error! Here is Description - \(err.errorDescription)")
            }
        }
    }
    
    // MARK: Get restaurant review count
    func getRestaurantReviewCountRequest(restIdx: Int) {
        let url = "https://simplewrite.shop/app/reviews/restaurants/\(restIdx)/count"
        
        let header : HTTPHeaders = [
            "Content-Type" : "application/json"
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
                    print("DEBUG: Get restaurant review count success")
                    self.nowRestaurantReviewCount = res.result!
                    // self.homeTableView.reloadData()
                    // 전체 식당 테이블에 리뷰수 병합 요청해야됨
                }
                else { print("DEBUG: Get error, CODE is \(res.code!)") }
            case .failure(let err):
                print("DEBUG: Response error! Here is Description - \(err.errorDescription)")
            }
        }
    }
}


