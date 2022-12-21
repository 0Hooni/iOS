//
//  EmailLoginViewController.swift
//  CoupangEats Clone
//
//  Created by 송영훈 on 2022/12/05.
//

import UIKit
import Alamofire

class EmailLoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginBtn.layer.cornerRadius = 5
    }
    
    @IBAction func touchUpCloseBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    @IBAction func touchUpLoginBtn(_ sender: UIButton) {
        print("DEBUG: Login check")
        postRequest()
    }
}

// MARK: - Alamofire
extension EmailLoginViewController {
    func postRequest() {
        let url = "http://13.124.84.127/app/users/login"
        
        let header : HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let bodyData : Parameters = [
            "email" : emailTextField.text!,
            "password" : passwordTextField.text!
        ]
        
        AF.request( url, // [주소]
                    method: .post, // [전송 타입]
                    parameters: bodyData, // [전송 데이터]
                    encoding: JSONEncoding.default, // [인코딩 스타일]
                    headers: header // [헤더 지정]
        ).responseDecodable(of: LoginResponse.self) {
            response in
            switch response.result {
            case .success(let res):
                print("DEBUG: Response success!")
                if res.isSuccess == true{
                    print("DEBUG: Login success")
                    let userData = UserDefaults.standard
                    userData.setValue(res.result?.userIdx, forKey: "userIdx")
                    userData.setValue(res.result?.jwt, forKey: "jwt")
                    // 데이터 Set value 설정
                    UserDefaults.standard.synchronize()
                    
                    self.dismiss(animated: true)
                }
                else { print("DEBUG: Login fail. The error CODE is - \(res.code!)") }
            case .failure(let err):
                print("DEBUG: Response error! Here is Description - \(err.errorDescription!)")
            }
            
        }
    }
}

