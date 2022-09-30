//
//  ViewController.swift
//  SignUp
//
//  Created by 송영훈 on 2022/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    @IBAction func touchUpSetButton(_ sender: UIButton) {
        UserInformation.shared.name = nameField.text
        UserInformation.shared.age = ageField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

