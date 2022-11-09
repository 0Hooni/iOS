//
//  MainViewController.swift
//  Cat Adventure
//
//  Created by 송영훈 on 2022/11/08.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func start(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "GameViewController") else { return }
        self.present(vc, animated: false)
    }
    
}
