//
//  RequestData.swift
//  HanDdam
//
//  Created by 김동준 on 2020/01/15.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import Foundation

//MARK:- DetailRequestComponentsEnums
//실력의 부족으로 enum 활용도가 좋지 못함. 그래서 Enum에다가 RawValue를 넣어놓고 따로 뺴놓음. -> 나중에 수정 필요
enum Person : String {
    case groom = "신랑"
    case bride = "신부"
    case groomMother = "신랑어머니"
    case brideMother = "신부어머니"
    case groomFather = "신랑아버지"
    case brideFather = "신부아버지"
}

enum MakingType : String {
    case make = "맞춤"
    case borrow = "대여"
}

enum Age : String {
    
    case teen = "10대"
    case twenty = "20대"
    case thirty = "30대"
    case fourty = "40대"
    case fifty = "50대"
    case sixty = "60대"
    case seventy = "70대"
    case eighty = "80대"
    case ninety = "90대"
    }

enum Season : String {
    case spring = "봄"
    case summer = "여름"
    case fall = "가을"
    case winter = "겨울"
}

enum Fabric : String {
    case silk = "실크"
    case waterSilk = "물실크"
}
