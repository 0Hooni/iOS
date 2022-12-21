// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let wishResponse = try? newJSONDecoder().decode(WishResponse.self, from: jsonData)

import Foundation

// MARK: - FavoriteResponse
struct FavoriteResponse: Decodable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: [FavoriteResponseResult]?
}

// MARK: - FavoriteResponseResult
struct FavoriteResponseResult: Decodable {
    let wishIdx, userIdx, restIdx: Int?
    let restName: String?
    let restImagePath: String?
    let restScore: Double?
    let restReviewNum: Int?
    let restDistance: Double?
    let restDeliveryTime: Int?
    let restDeliveryTip: String?
    let activeYn: Bool?
}
