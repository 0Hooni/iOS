// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let logintResponse = try? newJSONDecoder().decode(LogintResponse.self, from: jsonData)

import UIKit

// MARK: - LoginResponse
struct LoginResponse: Decodable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: LoginResponseResult?
}

// MARK: - LoginResponseResult
struct LoginResponseResult: Decodable {
    let userIdx: Int?
    let jwt: String?
}
