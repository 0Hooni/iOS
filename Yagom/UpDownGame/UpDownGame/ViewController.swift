//
//  ViewController.swift
//  UpDownGame
//
//  Created by dev_klein.h on 2021/07/02.
//

import UIKit

class ViewController: UIViewController {
    
    var randomValue : Int = 0
    var tryCount : Int = 0
    
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minValueLabel: UILabel!
    @IBOutlet weak var maxValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        // Do any additional setup after loading the view.
        
        reset()
    }
    
    @IBAction func sliderValueChange(_ sender: UISlider){
        print(sender.value)
        let integerValue :Int = Int(sender.value)
        sliderValueLabel.text = String(integerValue)
        
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { (action) in
                                        self.reset()
        }
        
        alert.addAction(okAction)
        present(alert,
                animated: true,
                completion: nil)
    }
    
    @IBAction func touchUpHitButton(_ sender: UIButton){
        print(slider.value)
        let hitValue : Int = Int(slider.value)
        slider.value = Float(hitValue)      //왜 다시 float로 바꾸는가 -> slider는 애초에 float로 쓰게 설계되어있음
        
        tryCount = tryCount + 1
        tryCountLabel.text = "\(tryCount) / 5"
        
        if randomValue == hitValue {
            // print("YOU WIN!")
            showAlert(message: "YOU WIN!")
            reset()
        } else if tryCount >= 5 {
            // print("YOU LOSE...")
            showAlert(message: "YOU LOSE...")
            reset()
        } else if hitValue < randomValue {
            slider.minimumValue = Float(hitValue)
            minValueLabel.text = String(hitValue)
        } else {    //if hitValue > randomValue
            slider.maximumValue = Float(hitValue)
            maxValueLabel.text = String(hitValue)
        }
    }
        
    
    
    @IBAction func touchUpResetButton(_ sender:UIButton){
        print("touch Up Reset Button")
        reset()
    }
    
    func reset() {
        print("reset!")
        randomValue = Int.random(in: 0...30)    //... <- 범위 연산자의 일부
        print(randomValue)
        tryCount = 0
        tryCountLabel.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        
        minValueLabel.text = "0"
        maxValueLabel.text = "30"
        sliderValueLabel.text = "15"
    }
}

