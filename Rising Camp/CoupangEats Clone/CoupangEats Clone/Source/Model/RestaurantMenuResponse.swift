// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let restaurantMenuResponse = try? newJSONDecoder().decode(RestaurantMenuResponse.self, from: jsonData)

import Foundation

// MARK: - RestaurantMenuResponse
struct RestaurantMenuResponse: Decodable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: [RestaurantMenuResponseResult]?
}

// MARK: - RestaurantMenuResponseResult
struct RestaurantMenuResponseResult: Decodable {
    let menuID, restaurantID: Int?
    let gbCode, name: String?
    let price: Int?
    let content: String?
    let refID: Int?
    let menuImage: String?
    let optionID: Int?

    enum CodingKeys: String, CodingKey {
        case menuID = "menuId"
        case restaurantID = "restaurantId"
        case gbCode, name, price, content
        case refID = "refId"
        case menuImage
        case optionID = "optionId"
    }
}
