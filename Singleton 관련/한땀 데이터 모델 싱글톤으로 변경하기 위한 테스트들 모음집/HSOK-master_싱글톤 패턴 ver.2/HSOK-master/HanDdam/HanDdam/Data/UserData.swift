//
//  UserData.swift
//  HanDdam
//
//  Created by 김동준 on 2020/01/15.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import Foundation
import UIKit

//여기서 인스턴스를 만들고, 그걸 사용하면 됨

class User {
    static let getInstance = User()
    
    let name : String
    let phoneNumber : String
    var myRequests : [Request]
    
    private init() {
        self.name = ""
        self.phoneNumber = ""
        self.myRequests = []
    }
}

struct Request {
    var person : [String]
    var detailRequestPerPerson : [DetailRequest]
    var memo : [String] //LastCheckVC에서 메모를 어떻게 처리해야할지 생각해보기
    var date : Date
    
    init() {
        self.person = []
        self.detailRequestPerPerson = []
        self.memo = []
        self.date = Date()
    }
    
    mutating func defaultMemo(textViewText:String) -> () {
        if textViewText == "예) 신부 - 저고리 색깔을 더 연하게 하고 싶어요.\n시어머님 - 조끼를 추가하고 싶어요." {
            self.memo.append("없음")
        } else {
            self.memo.append(textViewText)
        }
    }
}

struct DetailRequest {
    var makingType : String
    var age : String
    var season : String
    var detailImage : UIImage? //파이어베이스에 있는 URL주소에서 String을 가지고 와서 UIImage(named:)로 처리
    //그럼 그 URL주소 받아오는건 다른 모델에서 스트링값을 받고, 그 값을 가지고 여기서 UIImage로 받음.
    var fabric : String
    
    
    //var memo : String?
    
    init() {
        self.makingType = ""
        self.age = ""
        self.season = ""
        //Image는 어떻게 추가해야할지 모르겠음
        self.fabric = ""
        
        
    }
    
    init(makingType:String, age:String, season:String, detailImage:UIImage, fabric:String) {
        self.makingType = makingType
        self.age = age
        self.season = season
        self.detailImage = detailImage
        self.fabric = fabric
    }
}


//person은 바로 request.person으로 접근
var detailRequest : DetailRequest = DetailRequest() //--> 얘가 RequestTableViewController에 옵셔널로 선언되어 있고, LastCheckTVC에서 newRequest라는 메소드를 통해서 새로운 detailRequest 인스턴스를 생성해서 이 파일의 아래에 생성된 request 인스턴스에 추가되도록 하면 되지 않나?
var request : Request = Request()

// 그러면 user만 여기다가 전역변수로서 선언해놓고, detailRequest와 request 인스턴스는 모두 RequestTVC에다가 옵셔널로 선언을 해놔. 그러고 user에다가 request를 myrequest에 추가시키면 user에만 접근하면 되는거잖아? 오오오오!
//설마 이것때문에 싱글톤이 생긴건...가????

let user = User.getInstance
//이거 싱글턴 패턴만 만들어내면 지금 모든게 해결될 것 같음.
// 싱글톤을 만든다고 쳤을떄 user를 타입 프로퍼티로 만들고 그 내부에 detailRequest와 request 인스턴스를 선언해서 사용하면 되지않을까?????

//최종 정리
// 여기다가 user만 선언해놓자. (user만 싱글톤으로 만들면 되지 않을까?
// detailRequest와 request는 모두 RequestTVC로 옮겨놓자 (optional로 선언)
// detailRequest를 DetailRequestTVC에서 다음 버튼을 클릭했을때 하나씩 추가되도록 선언.
//LastCheckTVC에서 버튼을 클릭시에 모달 디스미스와 함께 detailRequest 인스턴스를 하나 생성해놓 RequestTVC에 추가되도록ㅎ
