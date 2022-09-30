//
//  Friend.swift
//  MyFriends
//
//  Created by 송영훈 on 2022/09/26.
//
/*
 {
     "name":"하나",
     "age":22,
     "address_info": {
         "country":"대한민국",
         "city":"울산"
     }
 }
 */
import Foundation

struct Friend: Codable {
    struct Address: Codable {
        let country: String
        let city: String
    }
    
    let name: String
    let age: Int
    let address_info: Address
}
