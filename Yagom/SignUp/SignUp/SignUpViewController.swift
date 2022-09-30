//
//  SignUpViewController.swift
//  SignUp
//
//  Created by 송영훈 on 2022/08/10.
//

import UIKit

class SignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var touchGesture: UITapGestureRecognizer!
    
    @IBOutlet weak var IDTextField: UITextField!
    @IBOutlet weak var PWTextField: UITextField!
    @IBOutlet weak var PWCheckTextField: UITextField!
    @IBOutlet weak var selfIntroduce: UITextView!
    
    @IBOutlet weak var cancleButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func dismissSignUpModal() {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func touchUPImageView(_ sender: Any) {
        // code
    }
    
    
    
    
}
