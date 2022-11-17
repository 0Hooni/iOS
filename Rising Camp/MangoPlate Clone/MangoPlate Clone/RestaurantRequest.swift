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
    func getRestaurantData(_ vc: FindViewController) {
        let serviceKey = "FJpGBqJV2efZuUTJX%2Flndu%2BilGklnYbx8amGgV3ItzUUrVCa38U1aFKa2b%2F58vnLrJbhKjgPLnez5QMEpfY9g%3D%3D"
        let type = "JSON"
        var pageNo = 1
        var numOfRows = 100
        
        
        let url = "http://apis.data.go.kr/3510500/general_restaurants/getList?serviceKey=\(serviceKey)&type=\(type)&pageNo=\(pageNo))&numOfRows=\(numOfRows)"
        let params: Parameters = [
            "serviceKey" : "lFJpGBqJV2efZuUTJX%2Flndu%2BilGklnYbx8amGgV3ItzUUrVCa38U1aFKa2b%2F58vnLrJbhKjgPLnez5QMEpfY9g%3D%3D",
            "type" : "JSON",
            "pageNo" : "1",
            "numOfRows" : "100"
        ]
        
        // MARK: - HTTP GET method
        AF.request(url, method: .get, parameters: params, headers: nil).responseDecodable(of: RestaurantResponse.self) {
            response in
            switch response.result {
            case .success(let response):
//                print("DEBUG: Response \(response)")
                vc.didSuccess(response)
                
            case .failure(let error):
                print("DEBUG: Get Error \(error.localizedDescription)")
            }
        }
    }
}
