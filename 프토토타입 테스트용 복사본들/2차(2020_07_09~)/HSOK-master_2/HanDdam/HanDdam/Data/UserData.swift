//
//  UserData.swift
//  HanDdam
//
//  Created by 김동준 on 2020/01/15.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import Foundation
import UIKit

//어찌어찌 해서 데이터 모델이 완성되면 그 다음에 할일
//user 인스턴스를 저장시켜서 앱이 처음 로딩될 시에 유저의 정보를 받아와서 정보를 보여준다. userDefault에도 저장시키고, 서버에도 올리고. -> 이거 구분지을 필요 있음.

//모든 데이터를 하나의 클래스에서 관리하려고 해서 문제다. 데이터를 받아오는 것은 화면단위로 받아와야한다.
//화면 단위에서 필요한 데이터를 viewDidLoad에서 받아와야 한다.

//아마 User instance는 회원가입을 할때 인스턴스가 생성이 되겠지? 그 뒤에는 앱 실행시에 UserDefaults에서 가져오는 걸로 생각하면 될 듯

//MARK:- User
struct User : Codable {
    // 유저 정보
    let id:String
    let password:String
    let nickname:String
    let phoneNumber:String
    // UUid -> 이게 필요한지 희종썜께 여쭤보기, 답변 : UUid는 client가 만드는게 아니라 서버에서 만들어서 주는 것임.
    //let uuid:String
    //유저가 요청한 request 리스트
    var myRequests:[Request] = []
    //증빙서 리스트 -> 일단은 UIImage로 대체! 원래라면 리스트가 되어야 겠지
    var myCertifications : UIImage = UIImage(named: "Certification")!
    
//    init() {
//        self.id = ""
//        self.password = ""
//        self.nickname = ""
//        self.phoneNumber = ""
//        //self.uuid = NSUUID().uuidString
//    }
    
    init(info:SignUpComponent) {
        self.id = info.id
        self.password = info.password
        self.nickname = info.nickname
        self.phoneNumber = info.phoneNumber
    }
    
    enum CodingKeys:String, CodingKey {
        case id = "user_id"
        case password = "password"
        case nickname = "nickname"
        case phoneNumber = "phone_num"
    }
}

//MARK:- Request
struct Request {
    //request uuid
    //let uuid:String
    var detailRequestPerPerson : [DetailRequest]
    //생성날짜
    let date : Date
    
    init() {
        //self.uuid = NSUUID().uuidString
        self.detailRequestPerPerson = []
        self.date = Date()
    }
}
// 내가 reponse 요청하고 콜라가 필요한 request를 나에게 말해준다.
//MARK:- DetailRequest
struct DetailRequest {
    // 대상
    var person : String
    // 세부 견적
    var makingType : String
    var age : String
    var season : String
    //detialImage 녀석 String?으로 바꿔야되지만 일단은 테스트를 위해 UIImage로 해놓겠음
    var detailImage : UIImage? //-> 이놈을 인코딩 시킬때 이미지를 데이터로 바꿔서 올려야 함.
    var fabric : String
    // 메모
    var memo : String?
    
    init() {
        self.person = ""
        self.makingType = ""
        self.age = ""
        self.season = ""
        //Image는 어떻게 추가해야할지 모르겠음
        self.fabric = ""
        self.memo = ""
    }
    
    //TextView delegate도 처리를 해줘야 함.
    mutating func defaultMemo(textViewText:String) -> () {
        if textViewText == "예) 신부 - 저고리 색깔을 더 연하게 하고 싶어요.\n시어머님 - 조끼를 추가하고 싶어요." {
            self.memo = "없음"
        } else {
            self.memo = textViewText
        }
    }
}

//전역변수를 쓰면 안되는 이유
//-> 하나의 VC만 바꾸고 싶은데 전역변수로 하게 되면 전체를 다 바꿔버려야 하기 때문에 노가다 작업이 될게 뻔하기 때문..

//person은 바로 request.person으로 접근
//이 detailRequst란 놈이 여기서 있어도 tableViewReloadMethod를 통해 재 생성이 되는 건가?

var detailRequest : DetailRequest = DetailRequest() //--> 얘가 RequestTableViewController에 옵셔널로 선언되어 있고, LastCheckTVC에서 newRequest라는 메소드를 통해서 새로운 detailRequest 인스턴스를 생성해서 이 파일의 아래에 생성된 request 인스턴스에 추가되도록 하면 되지 않나?

var request : Request = Request()

// 그러면 user만 여기다가 전역변수로서 선언해놓고, detailRequest와 request 인스턴스는 모두 RequestTVC에다가 옵셔널로 선언을 해놔. 그러고 user에다가 request를 myrequest에 추가시키면 user에만 접근하면 되는거잖아? 오오오오!
//설마 이것때문에 싱글톤이 생긴건...가????

var user : User = User(info: (id:"qwer", password:"asdf", nickname:"garlic", phoneNumber:"01012345678"))
//이거 싱글턴 패턴만 만들어내면 지금 모든게 해결될 것 같음.
// 싱글톤을 만든다고 쳤을떄 user를 타입 프로퍼티로 만들고 그 내부에 detailRequest와 request 인스턴스를 선언해서 사용하면 되지않을까?????

//최종 정리
// 여기다가 user만 선언해놓자. (user만 싱글톤으로 만들면 되지 않을까?
// detailRequest와 request는 모두 RequestTVC로 옮겨놓자 (optional로 선언)
// detailRequest를 DetailRequestTVC에서 다음 버튼을 클릭했을때 하나씩 추가되도록 선언.
//LastCheckTVC에서 버튼을 클릭시에 모달 디스미스와 함께 detailRequest 인스턴스를 하나 생성해놓 RequestTVC에 추가되도록ㅎ
