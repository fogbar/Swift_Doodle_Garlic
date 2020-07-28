//
//  DummyData.swift
//  HanDdam
//
//  Created by 김동준 on 2020/02/25.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import Foundation

/*
 //List 1
 let dummy1 = DetailRequest(makingType: MakingType.make.rawValue, age: Age.thirty.rawValue, season: Season.spring.rawValue, detailImage:#imageLiteral(resourceName: "dummyImage1"), fabric: Fabric.silk.rawValue, memo: "서비스 좀 많이 주이소..") //-> 신부
 let dummy2 = DetailRequest(makingType: MakingType.borrow.rawValue, age: Age.seventy.rawValue, season: Season.spring.rawValue, detailImage: , fabric: Fabric.silk.rawValue, memo: "메모가 굳이 필요가 있을까? 그냥 갔을떄 말하면 되는데? 만약 메모 칸을 넣는다면 어떤 점들이 적혀질지 유추해보기") //-> 친정어머니
 let dummy3 = DetailRequest(makingType: MakingType.make.rawValue, age: Age.eighty.rawValue, season: Season.spring.rawValue, detailImage: , fabric: Fabric.silk.rawValue, memo: "얘들아 같이 메모칸이 필요할지에 대해서 고민해보자ㅏㅏㅏ") //-> 시어머니
 
 //List 2
 let dummy4 = DetailRequest(makingType: MakingType.make.rawValue, age: Age.fourty.rawValue, season: Season.winter.rawValue, detailImage: , fabric: Fabric.silk.rawValue, memo: "저 장가 늦게가요 ㅎ") //-> 신부
 let dummy5 = DetailRequest(makingType: MakingType.make.rawValue, age: Age.fourty.rawValue, season: Season.winter.rawValue, detailImage: , fabric: Fabric.silk.rawValue, memo: "그러니깐") //-> 신랑
 let dummy6 = DetailRequest(makingType: MakingType.make.rawValue, age: Age.eighty.rawValue, season: Season.winter.rawValue, detailImage: , fabric: Fabric.silk.rawValue, memo: "DC좀 마이 해주소") //-> 친정어머니
 let dummy7 = DetailRequest(makingType: MakingType.make.rawValue, age: Age.eighty.rawValue, season: Season.winter.rawValue, detailImage: , fabric: Fabric.silk.rawValue, memo: "아따 돈 많이 드네") //-> 시어머니
 
 //List 3
 let dummy8 = DetailRequest(makingType: MakingType.make.rawValue, age: Age.twenty.rawValue, season: Season.fall.rawValue, detailImage: , fabric: Fabric.waterSilk.rawValue, memo: "저희 일찍 결혼해요 ㅎ") //-> 신부
 let dummy9 = DetailRequest(makingType: MakingType.borrow.rawValue, age: Age.teen.rawValue, season: Season.fall.rawValue, detailImage: , fabric: Fabric.waterSilk.rawValue, memo: "싸게싸게 해주이소") //-> 신랑
 let dummy10 = DetailRequest(makingType: MakingType.borrow, age: Age.teen, season: Season.spring, detailImage: , fabric: Fabric.waterSilk.rawValue, memo: "돈이 읎다예 ㅠ") //-> 친정어머니
 */


//사장님들 bidder Dummy Data
let bidderDummy1 = Bidder(storeName: "우리옷 진솔 한복", phoneNumber: "123", location: "456", biddingList: [biddingDummy1])
let bidderDummy2 = Bidder(storeName: "궁전 김민지 한복", phoneNumber: "456", location: "789", biddingList: [biddingDummy2])
let bidderDummy3 = Bidder(storeName: "정현주단", phoneNumber: "789", location: "101", biddingList: [biddingDummy3])

//사장님들 bidding Dummy Data
let biddingDummy1 = Bidding(price: "50만원", detailOfBidding: DetailOfBidding(priceAndDiscount: "", processAndTerm: "", serviceProduct: "", origin: "", design: "", designImage: [], color: "", colorImage: [], detail: "", detailImage: [], note: "", noteImage: []))
let biddingDummy2 = Bidding(price: "140만원", detailOfBidding: DetailOfBidding(priceAndDiscount: "", processAndTerm: "", serviceProduct: "", origin: "", design: "", designImage: [], color: "", colorImage: [], detail: "", detailImage: [], note: "", noteImage: []))
let biddingDummy3 = Bidding(price: "110만원", detailOfBidding: DetailOfBidding(priceAndDiscount: "", processAndTerm: "", serviceProduct: "", origin: "", design: "", designImage: [], color: "", colorImage: [], detail: "", detailImage: [], note: "", noteImage: []))
