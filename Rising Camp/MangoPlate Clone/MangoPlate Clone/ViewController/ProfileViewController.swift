//
//  ProfileViewController.swift
//  MangoPlate Clone
//
//  Created by 송영훈 on 2022/11/16.
//

import UIKit
import NaverThirdPartyLogin
import Alamofire

class ProfileViewController: UIViewController {
    
    
    
    // MARK: - Component & Var
    @IBOutlet weak var naviBar: UINavigationBar!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileEditButton: UIButton!

    var userName: String = ""
    var imageURL: String = ""
    var emailAddress: String = ""
    var phoneNumber: String = ""
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DEBUG: View did load")
        // Do any additional setup after loading the view.
        
        // MARK: - custom UI
        // 상태바 배경색 변경
        changeStatusBarBgColor(bgColor: .white)
        // 네비게이션바 하단 그림자 제거
        naviBar.shadowImage = UIImage()
        
        // 프로필 이미지 원형
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        profileImageView.clipsToBounds = true
        
        // 프로필 수정 버튼 커스텀
        profileEditButton.titleLabel?.font = .systemFont(ofSize: 15)
        profileEditButton.layer.cornerRadius = 16
        profileEditButton.layer.borderWidth = 1
        profileEditButton.layer.borderColor = UIColor.lightGray.cgColor
        
        self.profileNameLabel.text = userName
        guard let url = URL(string: imageURL) else { return }
        self.profileImageView.load(url: url)
    }
    
    
    // MARK: - Function
    // 상태바 색상변경 함수
    func changeStatusBarBgColor(bgColor: UIColor?) {
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.first
            let statusBarManager = window?.windowScene?.statusBarManager
            
            let statusBarView = UIView(frame: statusBarManager?.statusBarFrame ?? .zero)
            statusBarView.backgroundColor = bgColor
            
            window?.addSubview(statusBarView)
        } else {
            let statusBarView = UIApplication.shared.value(forKey: "statusBar") as? UIView
            statusBarView?.backgroundColor = bgColor
        }
    }
    // 프로토콜을 통한 로그인 데이터 수신
}

// MARK: - UIImageView load URL Image
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}