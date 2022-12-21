//
//  MyTabbarController.swift
//  CoupangEats Clone
//
//  Created by 송영훈 on 2022/12/05.
//

import UIKit

class MyTabbarController: UITabBarController, UITabBarControllerDelegate {
    
    var tabbarTouchEnable = true    // 터치시 뷰 전환에 대한 판정
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        if item.title ==  "즐겨찾기" {
            tabbarTouchEnable = false
            if UserDefaults.standard.value(forKey: "userIdx") != nil {
                NotificationCenter.default.post(name: .pushFavoriteView, object: nil)
                print("DEBUG: Post noti center for push favorite view on current Navigation controller")
            }
            else {
                let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginPopupViewController") as! LoginPopupViewController
                
                nextVC.modalPresentationStyle = .overCurrentContext
                self.present(nextVC, animated: false)
            }
        }
        else if item.title ==  "주문내역" {
            if UserDefaults.standard.value(forKey: "userIdx") != nil {
                tabbarTouchEnable = true
            }
            else {
                tabbarTouchEnable = false
                let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginPopupViewController") as! LoginPopupViewController
                
                nextVC.modalPresentationStyle = .overCurrentContext
                self.present(nextVC, animated: false)
            }
        }
        else if item.title == "My 이츠" {
            if UserDefaults.standard.value(forKey: "userIdx") != nil {
                tabbarTouchEnable = true
            }
            else {
                tabbarTouchEnable = false
                let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginPopupViewController") as! LoginPopupViewController
                
                nextVC.modalPresentationStyle = .overCurrentContext
                self.present(nextVC, animated: false)
            }
        }
        else {
            tabbarTouchEnable = true
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return tabbarTouchEnable
    }
}

// MARK: - Notification center name
extension Notification.Name {
    static let pushFavoriteView = Notification.Name("pushFavoriteView")
}
