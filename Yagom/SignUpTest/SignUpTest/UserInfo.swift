//
//  UserInfo.swift
//  SignUp
//
//  Created by 송영훈 on 2022/07/26.
//

import Foundation

class UserInformation {
    private init() { }
    static let shared: UserInformation = UserInformation()
    
    var name: String?
    var age: String?
}
