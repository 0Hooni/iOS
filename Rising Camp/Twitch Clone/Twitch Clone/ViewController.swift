//
//  ViewController.swift
//  Twitch Clone
//
//  Created by 송영훈 on 2022/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var JCOnair: UIView!
    @IBOutlet weak var VROnair: UIView!
    @IBOutlet weak var LOLOnair: UIView!
    @IBOutlet weak var LAOnair: UIView!
    @IBOutlet weak var TFTOnair: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        JCOnair.layer.masksToBounds = true
        JCOnair.layer.cornerRadius = 5
        
        VROnair.layer.masksToBounds = true
        VROnair.layer.cornerRadius = 5
        
        LOLOnair.layer.masksToBounds = true
        LOLOnair.layer.cornerRadius = 5
        
        LAOnair.layer.masksToBounds = true
        LAOnair.layer.cornerRadius = 5
        
        TFTOnair.layer.masksToBounds = true
        TFTOnair.layer.cornerRadius = 5
    }
    
    
}
