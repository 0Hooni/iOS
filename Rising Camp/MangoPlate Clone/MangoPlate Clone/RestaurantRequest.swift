//
//  RestaurantRequest.swift
//  MangoPlate Clone
//
//  Created by 송영훈 on 2022/11/15.
//

import UIKit
import Alamofire
import AFNetworking

class RestaurantRequest{
    func getRestaurantData(VC: FindViewController,pageNo: Int) {
        let url = "http://apis.data.go.kr/3510500/general_restaurants/getList?serviceKey=lFJpGBqJV2efZuUTJX%2Flndu%2BilGklnYbx8amGgV3ItzUUrVCa38U1aFKa2b%2F58vnLrJbhKjgPLnez5QMEpfY9g%3D%3D&type=JSON&pageNo=\(pageNo)&numOfRows=1"
        let params: Parameters = [
            "serviceKey" : "lFJpGBqJV2efZuUTJX%2Flndu%2BilGklnYbx8amGgV3ItzUUrVCa38U1aFKa2b%2F58vnLrJbhKjgPLnez5QMEpfY9g%3D%3D",
            "type" : "JSON",
            "pageNo" : "1",
            "numOfRows" : "1"
        ]
        
        // HTTP Method : GET
        AF.request(url, method: .get, parameters: params, headers: nil)
            .responseDecodable(of: RestaurantResponse.self) {
                response in
                switch response.result {
                case .success(let response):
                    print("DEUBG: Response success - \(response)")
                    VC.didSuccess(response)
                case .failure(let error):
                    print("DEBUG: Response fail - \(error)")
                }
            }
    }
}
