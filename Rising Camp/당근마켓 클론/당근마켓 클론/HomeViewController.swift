//
//  ViewController.swift
//  당근마켓 클론
//
//  Created by 송영훈 on 2022/10/31.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: variable
    let testList = Test.data
    let cellName = "TestListCell"
    let cellReuseIdentifier = "testCell"
    
    // MARK: Object
    @IBOutlet weak var leftTitle: UIBarButtonItem!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    // MARK: Func
    private func registerXib() {
        let nibName = UINib(nibName: cellName, bundle: nil)
        mainCollectionView.register(nibName, forCellWithReuseIdentifier: cellReuseIdentifier)
    }

    // MARK: View Delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        // Do any additional setup after loading the view.
        self.leftTitle.title = "용현1,4동"
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
    }
    func numberFormatter(number: Int) -> String {       // 3자리마다 콤마로 끊어주는 함수
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: NSNumber(value: number))!
    }


}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = mainCollectionView.dequeueReusableCell(
            withReuseIdentifier: cellReuseIdentifier,
            for: indexPath) as? HomeCustomCollectionViewCell
            else { return UICollectionViewCell() }
        
        let target = testList[indexPath.row]
        
        let img = UIImage(named: "\(target.productName)_1.jpeg")
        cell.productThumbnail.image = img
        cell.productName.text = target.productName
        cell.sellerTown.text = target.town
        cell.productPrice.text = numberFormatter(number: target.price)
        cell.chatCount.text = numberFormatter(number: target.chatCount)
        cell.attentionCount.text = numberFormatter(number: target.attentionCount)
        
        return cell
    }
    
    
    
}
