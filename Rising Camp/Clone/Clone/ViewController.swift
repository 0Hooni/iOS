//
//  ViewController.swift
//  Clone
//
//  Created by 송영훈 on 2022/10/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var JCOnAir: UIView!
    @IBOutlet weak var VLOnAir: UIView!
    @IBOutlet weak var LOLOnAir: UIView!
    @IBOutlet weak var LAOnAir: UIView!
    @IBOutlet weak var TFTOnAir: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        JCOnAir.layer.masksToBounds = true
        JCOnAir.layer.cornerRadius = 5
        
        VLOnAir.layer.masksToBounds = true
        VLOnAir.layer.cornerRadius = 5
        
        LOLOnAir.layer.masksToBounds = true
        LOLOnAir.layer.cornerRadius = 5
        
        LAOnAir.layer.masksToBounds = true
        LAOnAir.layer.cornerRadius = 5
        
        TFTOnAir.layer.masksToBounds = true
        TFTOnAir.layer.cornerRadius = 5
    }

    
    
}

