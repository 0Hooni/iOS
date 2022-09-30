//
//  SubInfoViewController.swift
//  SignUp
//
//  Created by 송영훈 on 2022/08/14.
//

import UIKit

class SubInfoViewController: UIViewController {

    @IBOutlet weak var phoneNumLabel: UILabel!
    @IBOutlet weak var phoneNumTextField: UITextField!
    
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var birthDayPickerLabel: UILabel!
    @IBOutlet weak var birthDayPicker: UIDatePicker!
    
    @IBOutlet weak var cancleButton: UIButton!
    @IBOutlet weak var beforeButton: UIButton!
    @IBOutlet weak var joinButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissSubInfoModal() {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
