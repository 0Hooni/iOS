// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct RestaurantResponse: Decodable {
    var response: Response
}

// MARK: - Response
struct Response: Decodable {
    var pageNo: Int
    var header: Header
    var body: Body
    var totalCount: Int
    var type: String
    var numOfRows: Int
}

// MARK: - Body
struct Body: Decodable {
    var items: Items
}

// MARK: - Items
struct Items: Decodable {
    var item: Item
}

// MARK: - Item
struct Item: Decodable {
    var lot: Double
    var no: Int
    var bsnNm, ltAddr, cat, roadNmAddr: String
    var lat: Double

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
    var resultCode, resultMsg: String
}
