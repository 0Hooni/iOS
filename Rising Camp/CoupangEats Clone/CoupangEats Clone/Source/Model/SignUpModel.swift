//
//  SignUpModel.swift
//  CoupangEats Clone
//
//  Created by 송영훈 on 2022/12/07.
//

import UIKit
import Alamofire

struct LoginService {
    let LoginUrl = "http://13.124.84.127/app/users"
    
    func getLoginResult(type: Int, id: String, name: String, email: String, completion: @escaping (_ data: [LoginInfo]) -> Void) {
        let body: Parameters = [
            "type": type,
            "id": id,
            "name": name,
            "email": email
        ]
        
        Alamofire.request(SocialLoginUrl, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON {
            response in
            
            switch response.result{
            case .success:
                guard let result = response.data else {return}
                
                do {
                    let decoder = JSONDecoder()
                    let json = try decoder.decode(LoginResult.self, from: result)
                    
                    if json.result == 2000{
                        completion(json.data)
                    }
                } catch {
                    print("error!\(error)")
                }
            default:
                return
            }
        }
    }
}
