//
//  MenuDetailViewController.swift
//  CoupangEats Clone
//
//  Created by 송영훈 on 2022/12/14.
//

import UIKit

class MenuDetailViewController: UIViewController {
    
    // MARK: - var & object
    var menuImageURL: String! = nil
    var menuName: String! = nil
    var menuComent: String! = nil
    
    var menuPrice: Int! = nil
    var menuCount: Int = 0
    
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var menuNameLabel: UILabel!
    @IBOutlet weak var menuComentLabel: UILabel!
    @IBOutlet weak var menuPriceLabel: UILabel!
    
    @IBOutlet weak var addOnCartBtn: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataOnView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customNavigationBackBtn()
    }
    // MARK: - Function
    // MARK: Custom navi bar
    func customNavigationBackBtn() {
        // Back buttom custom
        let backbutton = UIBarButtonItem(image: UIImage(named: "CoupangEats_Arrow_back"), style: .done, target: self, action: #selector(back))
        backbutton.tintColor = .black
        self.navigationItem.leftBarButtonItem = backbutton
        // back 버튼 제거시 사라지는 스와이프 제스처 살리기
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    // MARK: Set object data
    func setDataOnView() {
        self.menuImageView.load(url: self.menuImageURL)
        self.menuNameLabel.text = self.menuName
        self.menuComentLabel.text = self.menuComent
        self.menuPriceLabel.text = "\(numberFormatter(number: self.menuPrice))원"
    }
    
    // MARK: - @objc
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
}
