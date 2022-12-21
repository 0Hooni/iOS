//
//  SettingViewController.swift
//  CoupangEats Clone
//
//  Created by 송영훈 on 2022/12/07.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpLogoutBtn(_ sender: UIButton){
        print("DEBUG: Touch up logout button")
        let alert = UIAlertController(title:"로그아웃 하시겠습니까?",message: "",preferredStyle: UIAlertController.Style.alert)
        let cancle = UIAlertAction(title: "취소", style: .default, handler: nil)
        //확인 버튼 만들기
        let ok = UIAlertAction(title: "확인", style: .destructive, handler: {
            action in
            // 유저 정보 제거
            UserDefaults.standard.removeObject(forKey: "userIdx")
            UserDefaults.standard.removeObject(forKey: "jwt")
            
            // 홈 화면으로 탈출
            self.navigationController?.popViewController(animated: true)
        })
        alert.addAction(cancle)
        //확인 버튼 경고창에 추가하기
        alert.addAction(ok)
        present(alert,animated: true,completion: nil)
        
        
    }
}
