// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct RestaurantResponse: Decodable {
    let response: Response
}

// MARK: - Response
struct Response: Decodable {
    let pageNo: Int
    let header: Header
    let body: Body
    let totalCount: Int
    let type: String
    let numOfRows: Int
}

// MARK: - Body
struct Body: Decodable {
    let items: Items
}

// MARK: - Items
struct Items: Decodable {
    let item: Item
}

// MARK: - Item
struct Item: Decodable {
    let lot: Double
    let no: Int
    let bsnNm, ltAddr, cat, roadNmAddr: String
    let lat: Double

    enum CodingKeys: String, CodingKey {
        case lot, no
        case bsnNm = "bsn_nm"
        case ltAddr = "lt_addr"
        case cat
        case roadNmAddr = "road_nm_addr"
        case lat
    }
}

// MARK: - Header
struct Header: Decodable {
    let resultCode, resultMsg: String
}
