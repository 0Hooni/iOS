//
//  StartViewController.swift
//  MangoPlate Clone
//
//  Created by 송영훈 on 2022/11/16.
//
import UIKit
import NaverThirdPartyLogin
import Alamofire

class StartViewController: UIViewController, NaverThirdPartyLoginConnectionDelegate {
    // 로그인에 성공한 경우 호출
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        print("로그인 성공")
        // 로그인 성공시 뷰컨을 호출
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "UITabBarController") else { return }
        nextVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(nextVC, animated: true)
    }
    // refresh token
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        print("리프레시 토큰")
        getInfo()
    }
    // 로그아웃
    func oauth20ConnectionDidFinishDeleteToken() {
        print("로그아웃")
        getInfo()
    }
    // 모든 에러 처리
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print("---ERROR: \(error.localizedDescription)---")
    }
    
    
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    // 로그인 인스턴스
    let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginInstance?.delegate = self
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        loginInstance?.requestThirdPartyLogin()
    }
    @IBAction func skipButton(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "UITabBarController") else { return }
        nextVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(nextVC, animated: true)
    }
    @IBAction func logoutButton(_ sender: UIButton) {
        loginInstance?.requestDeleteToken()
    }
    
    // MARK: 회원 프로필 조회 API
    func getInfo() {
        guard let isValidAccessToken = loginInstance?.isValidAccessTokenExpireTimeNow() else { return }
        
        if !isValidAccessToken {
            return
        }
        
        guard let tokenType = loginInstance?.tokenType else { return }
        guard let accessToken = loginInstance?.accessToken else { return }
        
        let urlStr = "https://openapi.naver.com/v1/nid/me"
        let url = URL(string: urlStr)!
        
        let authorization = "\(tokenType) \(accessToken)"
        
        let req = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])
        
        req.responseJSON { response in
            guard let result = response.value as? [String: Any] else { return }
            guard let object = result["response"] as? [String: Any] else { return }
            guard let name = object["name"] as? String else { return }
            guard let email = object["email"] as? String else { return }
           

            
//            레이블에 데이터 전달
//            self.nameLabel.text = "\(name)"
//            self.emailLabel.text = "\(email)"
        }
    }
}
