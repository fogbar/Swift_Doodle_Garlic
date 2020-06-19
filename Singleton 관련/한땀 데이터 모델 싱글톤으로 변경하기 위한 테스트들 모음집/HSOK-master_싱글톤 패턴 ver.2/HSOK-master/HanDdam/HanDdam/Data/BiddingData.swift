//
//  BiddingData.swift
//  HanDdam
//
//  Created by 김동준 on 2020/01/15.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import Foundation

//현재 여기 있는 정보들은 모두 서버에서 가져와서 뿌려주어야할 데이터들임
//교수님께서 말씀해주신 JSON으로 더미데이터 만들어서 뿌리라는 말이 점차 이해되기 시작.
//한 번 만들고 파이어베이스에 올려서 가져와서 테이블 뷰에 뿌려보는 연습을 해야할 듯

struct Bidder { //한복집 사장님들
    let storeName : String
    let phoneNumber : String
    let location : String
    //그 외의 웹 페이지 주소라던지 대표 이미지 같은 것들은 Ui 상에서 아직 없기 때문에 보류
    
    var biddingList : [Bidding]?
}

struct Bidding {
    //let request : 아마 사용자의 어떤 요청 request에다가 입찰을 진행한건지 알아내기 위해서는 서버에서 UUID를 가져와서 집어넣어야 할 듯
    let price : String
    let detailOfBidding : DetailOfBidding
}

struct DetailOfBidding {
    //한복 가격 정보
    let priceAndDiscount : String //한복 가격정보 중 가격과 할인에 대한 정보
    //한복 기본 정보
    let processAndTerm : String // 한복 기본정보 중 맞춤/대여 과정과 소요기간
    let serviceProduct : String // 서비스 상품
    let origin : String //원산지와 제조지
    //한복집 코멘트
    let design : String //디자인
    let designImage : [String] //디자인에 들어가는 이미지들
    let color : String //색감
    let colorImage : [String] //색감에 들어가는 이미지들
    let detail : String //디테일
    let detailImage : [String] //다테일에 들어가는 이미지들
    let note : String //참고사항
    let noteImage : [String] //참고사항에 들어가는 이미지들
    //이미지들을 어떻게 추가해야할지... 아따 고민되네
    //이미지가 몇개 들어갈지 모르니 하... 스택뷰로 처리해야되는 부분인가...
}

