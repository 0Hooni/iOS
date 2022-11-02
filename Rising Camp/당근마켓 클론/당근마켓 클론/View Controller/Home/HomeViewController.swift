//
//  ViewController.swift
//  당근마켓 클론
//
//  Created by 송영훈 on 2022/10/31.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    
    // MARK: Object
    @IBOutlet weak var leftTitle: UIBarButtonItem!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    // MARK: Func
    let cellName = "TestListCell"
    let cellReuseIdentifier = "testCell"
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
        

        
    }


}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20 // 나중에는 item.count로 전환
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = mainCollectionView.dequeueReusableCell(
            withReuseIdentifier: cellReuseIdentifier,
            for: indexPath) as? HomeCustomCollectionViewCell
            else { return UICollectionViewCell() }
        
//        let target = testList[indexPath.row]
//
//        let img = UIImage(named: "\(target.image).png")
//        cell.testImage?.image = img
//        cell.testLabel?.text = target.title

        
        return cell
    }
    
    
    
}
