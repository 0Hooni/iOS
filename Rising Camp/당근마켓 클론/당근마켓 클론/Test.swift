//
//  Test.swift
//  당근마켓 클론
//
//  Created by 송영훈 on 2022/11/02.
//

import UIKit

struct Test {
    let productName: String
    let town: String
    let timeGo: String      // 업로드타임을 기준으로 카운트 해주는게 좋긴 함
    var price: Int
    var chatCount: Int
    var attentionCount: Int
}

extension Test {
    static var data = [
        Test(productName: "나이키 에어줌템포", town: "연수구 송도1동", timeGo: "끌올 6시간 전", price: 99000, chatCount: 1, attentionCount: 1),
        Test(productName: "이케아 펠로 암체어", town: "연수구 송도2동", timeGo: "6시간 전", price: 10000, chatCount: 1, attentionCount: 3),
        Test(productName: "버즈 라이브 팝니당", town: "미추홀구 주안5동", timeGo: "10시간 전", price: 50000, chatCount: 1, attentionCount: 4),
        Test(productName: "아이깨끗해 핸드워시 세트(새상품)", town: "숭의동", timeGo: "끌올 6시간 전", price: 5000, chatCount: 1, attentionCount: 4),
        Test(productName: "갤럭시 버즈 프로2 화이트", town: "미추홀구 주안동", timeGo: "22시간 전", price: 150000, chatCount: 1, attentionCount: 4),
        Test(productName: "엑소 굿즈", town: "남동구 간석2동", timeGo: "끌올 6시간 전", price: 10000, chatCount: 0, attentionCount: 1),
        Test(productName: "갤럭시탭s7 wifi모델 급처", town: "서구 가좌동", timeGo: "23시간 전", price: 310000, chatCount: 1, attentionCount: 6),
        Test(productName: "무드워머", town: "남동구 간석2동", timeGo: "끌올 6시간 전", price: 40000, chatCount: 0, attentionCount: 3),
        Test(productName: "더프리스타일+전용캐리어", town: "동구 화수2동", timeGo: "6시간 전", price: 620000, chatCount: 0, attentionCount: 1),
        Test(productName: "플레이몬스터 기모 맨투맨", town: "연수구 청학동", timeGo: "9시간 전", price: 13000, chatCount: 0, attentionCount: 2),
        Test(productName: "로지텍 G프로 hero 게이밍마우스", town: "미추홀구 주안1동", timeGo: "22시간 전", price: 20000, chatCount: 0, attentionCount: 3),
        Test(productName: "레비오사 미니냉장고", town: "미추홀구 주안8동", timeGo: "6시간 전", price: 50000, chatCount: 0, attentionCount: 2)
    ]
}
