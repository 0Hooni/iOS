//
//  chatList.swift
//  당근마켓 클론
//
//  Created by 송영훈 on 2022/11/05.
//

import UIKit

struct chatList {
    var userName: String
    var userTown: String
    var lastChatTimeGo: Int
    var lastChat: String
}

extension chatList {
    static var data = [
        chatList(userName: "yuze", userTown: "용현동", lastChatTimeGo: 1, lastChat: "0Hooni님이 이모티콘을 보냈어요."),
        chatList(userName: "당근이", userTown: "용현동", lastChatTimeGo: 1, lastChat: "예, 고마워요"),
        chatList(userName: "백머리", userTown: "도화2,3동", lastChatTimeGo: 2, lastChat: "0Hooni님이 이모티콘을 보냈어요."),
        chatList(userName: "신선삼", userTown: "숭의동", lastChatTimeGo: 2, lastChat: "나늠을 해주셔서 고맙고 감사하네요."),
        chatList(userName: "미니", userTown: "주안6동", lastChatTimeGo: 2, lastChat: "0Hooni님이 이모티콘을 보냈어요."),
        chatList(userName: "투리파파", userTown: "삼숭동", lastChatTimeGo: 3, lastChat: "죄송합니다. 앞에 오시는분만 거래하고 있어요."),
        chatList(userName: "MJ", userTown: "동춘3동", lastChatTimeGo: 3, lastChat: "감사합니다"),
        chatList(userName: "신고그만좀하셈", userTown: "학익동", lastChatTimeGo: 3, lastChat: "네네"),
        chatList(userName: "민종", userTown: "주안1동", lastChatTimeGo: 3, lastChat: "0Hooni님이 이모티콘을 보냈어요."),
        chatList(userName: "신사랑", userTown: "용현2동", lastChatTimeGo: 4, lastChat: "어디신가요?"),
        chatList(userName: "부산남", userTown: "구월1동", lastChatTimeGo: 4, lastChat: "SKT 통신사 핸드폰입니다."),
        chatList(userName: "비타민", userTown: "영홍면", lastChatTimeGo: 5, lastChat: "아! 알겠습니다 ㅎㅎ")
    ]
}
