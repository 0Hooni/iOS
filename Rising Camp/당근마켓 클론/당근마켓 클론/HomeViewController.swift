//
//  ViewController.swift
//  당근마켓 클론
//
//  Created by 송영훈 on 2022/11/03.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let testList = productList.data
    let cellName = "CustomCollectionViewCell"
    let cellReuseIdentifier = "customCell"
    var nowIdx = 0


    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var barTitle: UIBarButtonItem!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        // Do any additional setup after loading the view.
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = " "
    }
    
    
    // MARK: Function
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellReuseIdentifier,
            for: indexPath) as? CustomCollectionViewCell
        else { return UICollectionViewCell() }
        let target = testList[indexPath.row]
        
        
        let img = UIImage(named: "\(target.productName)_1")
        cell.productThunbnail.image = img
        cell.productName.text = target.productName
        cell.Town_Time.text = "\(target.town) • \(target.timeGo)"
        cell.productPrice.text = "\(numberFormatter(number: target.price))원"
        cell.chatCount.text = numberFormatter(number: target.chatCount)
        cell.attentionCount.text = numberFormatter(number: target.attentionCount)

        cell.productThunbnail.layer.cornerRadius = 5
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        nowIdx = indexPath.row
        performSegue(withIdentifier: "productDetail", sender: indexPath.item)
        
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as?
            ProductDetailViewController {
            nextVC.target = testList[nowIdx]
        }
    }
    private func registerXib() {
        let nibName = UINib(nibName: cellName, bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: cellReuseIdentifier)
    }
    func numberFormatter(number: Int) -> String {       // 3자리마다 콤마로 끊어주는 함수
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            
            return numberFormatter.string(from: NSNumber(value: number))!
        }
    

}

