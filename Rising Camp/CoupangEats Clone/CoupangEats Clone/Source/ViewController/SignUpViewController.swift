//
//  SignUpViewController.swift
//  CoupangEats Clone
//
//  Created by 송영훈 on 2022/12/06.
//

import UIKit
import Alamofire
import AnyFormatKit


class SignUpViewController: UIViewController {
    
    // MARK: - var
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberTextField.delegate = self
        signUpBtn.layer.cornerRadius = 5
    }
    
    @IBAction func touchUpCloseBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    @IBAction func touchUpSignUpBtn(_ sender: UIButton) {
        print("DEBUG: Touch up signup button")
        if emailTextField.text != nil
            && passwordTextField.text != nil
            && nameTextField.text != nil
            && phoneNumberTextField.text != nil {
            postRequest()
            
            self.dismiss(animated: true)
        }
    }
    
    
}

// MARK: - Alamofire
extension SignUpViewController {
    func postRequest() {
        let url = "http://13.124.84.127/app/users"
        
        let header : HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let bodyData : Parameters = [
            "name" : nameTextField.text!,
            "email" : emailTextField.text!,
            "password" : passwordTextField.text!,
            "phoneNumber" : phoneNumberTextField.text!
        ]
            
        AF.request( url, // [주소]
                    method: .post, // [전송 타입]
                    parameters: bodyData, // [전송 데이터]
                    encoding: JSONEncoding.default, // [인코딩 스타일]
                    headers: header // [헤더 지정]
        ).responseData { response in
            switch response.result {
            case .success(let res):
                print("DEBUG: Success post but can't confirm is it really success, check result - \(res.description)")
            case .failure(let err):
                print("DEBUG: Response error! Here is Description - \(err.errorDescription!)")
            }
            
        }
    }
}

// TextField 전화번호 자동 포맷설정
extension SignUpViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard let text = textField.text else {
            return false
        }
        let characterSet = CharacterSet(charactersIn: string)
        if CharacterSet.decimalDigits.isSuperset(of: characterSet) == false {
            return false
        }

        let formatter = DefaultTextInputFormatter(textPattern: "###-####-####")
        let result = formatter.formatInput(currentText: text, range: range, replacementString: string)
        textField.text = result.formattedText
        let position = textField.position(from: textField.beginningOfDocument, offset: result.caretBeginOffset)!
        textField.selectedTextRange = textField.textRange(from: position, to: position)
        return false
    }
}
