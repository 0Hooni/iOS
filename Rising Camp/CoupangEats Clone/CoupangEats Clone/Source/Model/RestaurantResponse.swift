// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let restaurantResponse = try? newJSONDecoder().decode(RestaurantResponse.self, from: jsonData)

import Foundation

// MARK: - RestaurantResponse
struct RestaurantResponse: Decodable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: [RestaurantResponseResult]?
}

// MARK: - RestaurantResponseResult
struct RestaurantResponseResult: Decodable {
    let restaurantID: Int?
    let name, address, number, ownerName: String?
    let companyRegistrationNumber, operationTime: String?
    let introductionBoard, originInfo: JSONNull?
    let timeDelivery, timePickup: Int?
    let tipDelivery, minDeliveryPrice, categories: String?
    let deleteFlag, fastDeliveryAvlb, pickupAvlb, deliveryAvlb: Bool?
    let restaurantImage, restaurantImage1: String?
    let restaurantImage2: String?
    let score: Double?
    let distance: Double?

    enum CodingKeys: String, CodingKey {
        case restaurantID = "restaurantId"
        case name, address, number, ownerName, companyRegistrationNumber, operationTime, introductionBoard, originInfo, timeDelivery, timePickup, tipDelivery, minDeliveryPrice, categories, deleteFlag, fastDeliveryAvlb, pickupAvlb, deliveryAvlb, restaurantImage, restaurantImage1, restaurantImage2, score, distance
    }
}

// MARK: - Encode/decode helpers
class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
