import UIKit

// MARK: - UserInfo
struct UserInfoResponse: Decodable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: UserInfoResponseResult?
}

// MARK: - UserInfoResponseResult
struct UserInfoResponseResult: Decodable {
    let userIdx: Int?
    let name, email, password, phoneNumber: String?
    let deleteYn, marketingAgreeYn, informNoticeAgreeYn, orderNoticeAgreeYn: Bool?
}

