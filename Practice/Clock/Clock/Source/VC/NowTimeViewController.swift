//
//  ViewController.swift
//  Clock
//
//  Created by 송영훈 on 2023/05/20.
//

import UIKit

class NowTimeViewController: UIViewController {
    
    @IBOutlet weak var currentTime: UILabel!
    var timerRepeat: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currentTime.text = getCurrentTime()
        startRepeatTimer()
    }

    func getCurrentTime() -> String{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH시 mm분 ss초"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: Date())
    }
    func startRepeatTimer() {
        let userInfo = "Timer 2"
        timerRepeat = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFireRepeat(timer:)), userInfo: userInfo, repeats: true)
    }
    @objc func timerFireRepeat(timer: Timer) {
        print("timerFireRepeat!")
        currentTime.text = getCurrentTime()
        if timer.userInfo != nil {
            print("\(String(describing: timer.userInfo))")  // Timer 2
            
        }
    }
    
}

