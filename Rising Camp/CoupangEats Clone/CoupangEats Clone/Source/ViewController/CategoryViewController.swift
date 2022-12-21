//
//  SearchViewController.swift
//  CoupangEats Clone
//
//  Created by 송영훈 on 2022/11/27.
//

import UIKit

class CategoryViewController: UIViewController {
    
    // MARK: - Object & var
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DEBUG: Category view did load")
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        customNaviBar()
        
        
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
    func customNaviBar() {
        // 네비바 그림자 제거
        self.navigationController?.navigationBar.shadowImage = UIImage()
        // Navigation bar에 Search bar 넣기
        let searchBarImageView = UIImageView()
        searchBarImageView.image = UIImage(named: "CoupangEats_Searchbar")
        self.navigationItem.titleView = searchBarImageView
        
        // Search bar 터치시 서치뷰로 이동
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.titleWasTapped))
        searchBarImageView.isUserInteractionEnabled = true
        searchBarImageView.addGestureRecognizer(recognizer)
    }
    func callNextVC(VCName: String) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "\(VCName)ViewController") else { return }
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    
    // MARK: - @objc
    @objc private func titleWasTapped() {
        callNextVC(VCName: "Search")
    }
    
    @objc func pushFavoriteView() {
        guard let favoVC = self.storyboard?.instantiateViewController(withIdentifier: "FavoriteViewController") as? FavoriteViewController
        else { return }
        
        self.navigationController?.pushViewController(favoVC, animated: true)
    }
}

// MARK: - Collection View Delegate
extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // MARK: Number of Cell in section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryName.count
    }
    // MARK: Cell custom
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        
        cell.categoryImageView.image = categoryImage[indexPath.item]
        cell.categoryLabel.text = categoryName[indexPath.item]
        
        return cell
    }
    // MARK: Cell did select
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchResultViewController") as? SearchResultViewController
        else { return }

        // 카테고리 이름 전달
        nextVC.nowCategoryName = categoryName[indexPath.item]
        nextVC.isCallByCategory = true
        nextVC.isCallByKeywordSearch = false
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    // MARK: - Cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = collectionView.frame.width / 3 - 1.0
        
        return CGSize(width: width, height: width*(1.2))
    }
    
    // MARK: CollectionView Cell의 위아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    // MARK: CollectionView Cell의 옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}


