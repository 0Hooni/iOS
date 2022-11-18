//
//  StartViewController.swift
//  MangoPlate Clone
//
//  Created by 송영훈 on 2022/11/16.
//
import UIKit
import Alamofire
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load")
    }
    
    // MARK: - Function
    // 카카오 로그인 버튼
    @IBAction func touchUpLoginButton(_ sender: UIButton) {
        // 카카오톡 설치 여부 확인 및 로그인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error { print(error) }
                else {
                    print("loginWithKakaoTalk() success.")
                    self.goToTabBar()    // 탭바로 화면전환
                    _ = oauthToken
                }
            }
        }
    }
    // 건너뛰기 버튼
    @IBAction func touchUpSkipButton(_ sender: UIButton) {
        goToTabBar()
    }
    func goToTabBar() {
        print("DEBUG: Go To TabBar Controller")
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "UITabBarController") as? UITabBarController else { return }
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
}

