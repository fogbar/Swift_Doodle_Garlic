//
//  BiddingData.swift
//  HanDdam
//
//  Created by 김동준 on 2020/01/15.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import Foundation

//MARK:- Bidder
struct Bidder { //한복집 사장님들
    //가게 이름
    let storeName:String
    //가게 전화번호
    let phoneNumber:String
    //가게 위치
    let location:String
    //가게 이미지
    let storeImage:String
    //사장님 이름
    let bidderName:String
    //가게 소개
    let introduce:String
    
    //지금 당장은 biddingList가 필요없을지언정 나중에 건수가 누적되면 표시해줄 수도 있으니 일단은 서버에는 넣어놓고, 여기에는 주석처리 해놓자.
//    var biddingList : [Bidding]
    
    init() {
        self.storeName = ""
        self.phoneNumber = ""
        self.location = ""
        self.storeImage = ""
        self.bidderName = ""
        self.introduce = ""
//        self.biddingList = []
    }
    
//    init(storeName:String, phoneNumber:String, biddingList:[Bidding]) {
//        self.storeName = storeName
//        self.phoneNumber = phoneNumber
//        self.biddingList = biddingList
//    }
}

//MARK:- Bidding
struct Bidding {
    //Request의 property 중 uuid
    //let requestUuid:String
    let price : String
    let detailOfBidding : DetailOfBidding
}

//MARK:- DetailOfBidding
struct DetailOfBidding {
    //한복 가격 정보
    let priceAndDiscount : String //한복 가격정보 중 가격과 할인에 대한 정보
    //서비스 상품
    let serviceProduct : String // 서비스 상품
    //한복집 코멘트
    let design : String //디자인
    let designImage : [String] //디자인에 들어가는 이미지들
    let color : String //색감
    let colorImage : [String] //색감에 들어가는 이미지들
    let detail : String //디테일
    let detailImage : [String] //다테일에 들어가는 이미지들
    let note : String //참고사항
    let noteImage : [String] //참고사항에 들어가는 이미지들
}

