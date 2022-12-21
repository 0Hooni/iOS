// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let restaurantResponse = try? newJSONDecoder().decode(RestaurantResponse.self, from: jsonData)

import Foundation

// MARK: - TopTenSearchResponse
struct TopTenSearchResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [TopTenSearchResponseResult]
}

// MARK: - TopTenSearchResponseResult
struct TopTenSearchResponseResult: Decodable {
    let searchIdx: Int
    let word: String
    let count: Int
    let createDate: String
}
