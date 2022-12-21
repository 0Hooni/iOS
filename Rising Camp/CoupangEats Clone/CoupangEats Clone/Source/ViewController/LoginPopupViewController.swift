//
//  LoginPopupViewController.swift
//  CoupangEats Clone
//
//  Created by 송영훈 on 2022/12/05.
//

import UIKit

class LoginPopupViewController: UIViewController {

    @IBOutlet weak var appLoginBtn: UIButton!
    @IBOutlet weak var emailLoginBtn: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DEBUG: Login popup view did load")
        
        // 버튼 레이아웃 커스텀
        emailLoginBtn.layer.borderWidth = 1
        appLoginBtn.layer.cornerRadius = 5
        emailLoginBtn.layer.cornerRadius = 5
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UserDefaults.standard.value(forKey: "userIdx") != nil {
            self.dismiss(animated: false)
        }
        else {
            print("DUBUG: No userIdx in userDefault")
        }
    }
    @IBAction func touchDimArea(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    @IBAction func touchUpEmailLoginBtn(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "EmailLoginViewController") as? EmailLoginViewController
        else { return }
        
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    @IBAction func touchUpSignUpLabel(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController
        else { return }
        
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
}
