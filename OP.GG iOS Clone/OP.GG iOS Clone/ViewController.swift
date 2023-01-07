//
//  ViewController.swift
//  OP.GG iOS Clone
//
//  Created by 송영훈 on 2023/01/07.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testLabel.text = "Hello world"
    }
    
}

