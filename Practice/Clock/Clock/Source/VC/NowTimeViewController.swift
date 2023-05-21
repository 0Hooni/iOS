//
//  ViewController.swift
//  Clock
//
//  Created by 송영훈 on 2023/05/20.
//

import UIKit

class NowTimeViewController: UIViewController {
    
    @IBOutlet weak var currentTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        currentTime.text = getCurrentTime()
    }

    func getCurrentTime() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "HH시 mm분 ss초"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: Date())
    }
    
}

