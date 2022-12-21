// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let wishResponse = try? newJSONDecoder().decode(WishResponse.self, from: jsonData)

import Foundation

// MARK: - CountResponse
struct CountResponse: Codable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: Int?
}
