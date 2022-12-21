// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let orderListResponse = try? newJSONDecoder().decode(OrderListResponse.self, from: jsonData)

import Foundation

// MARK: - OrderListResponse
struct OrderListResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [OrderListResponseResult]?
}

// MARK: - Result
struct OrderListResponseResult: Decodable {
    let getOrderRes: GetOrderRes?
    let orderMenuList: [OrderMenuList]?
}

// MARK: - GetOrderRes
struct GetOrderRes: Decodable {
    let orderIdx, userIdx, restIdx: Int?
    let restName: String?
    let restImagePath: String?
    let price: Int?
    let status: String?
    let score: Int?
    let msgToOwner, msgToDeliveryMan: String?
    let disposableYn, pickupYn: Bool?
    let createDate: String?
}

// MARK: - OrderMenuList
struct OrderMenuList: Decodable {
    let orderMenuIdx, orderIdx: Int?
    let menuName: String?
    let price, count: Int?
    let option1Name: String?
    let option1Price: Int?
    let option2Name: String?
    let option2Price: Int?
    let option3Name: String?
    let option3Price: Int?
    let option4Name: String?
    let option4Price: Int?
    let option5Name: String?
    let option5Price: Int?
}
