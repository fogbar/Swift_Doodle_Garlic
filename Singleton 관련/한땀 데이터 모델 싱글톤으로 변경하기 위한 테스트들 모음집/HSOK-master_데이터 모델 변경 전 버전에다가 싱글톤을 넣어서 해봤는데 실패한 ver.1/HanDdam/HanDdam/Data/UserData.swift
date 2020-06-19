//
//  UserData.swift
//  HanDdam
//
//  Created by 김동준 on 2020/01/15.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import Foundation
import UIKit

//var requestNumber:Int = user.myRequests.count

// User는 싱글톤으로 만들었음. 그럼 나머지 Request나 DetailRequest는 어떻게? User 외부에 선언해야할 것 같으니 외부에 선언해보자!
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
// 대상 선택 뷰에서 다음을 선택할때 생성을 해버리자.
class Request {
    var detailRequestList : [DetailRequest]
    var date : Date?
    
    //초기화 시킬때 date를 nil를 주고, 나중에 LastCheckVC에서 user에 append 시킬때 date를 초기화시켜서 내보내야겠다!!!!
    init() {
        self.detailRequestList = []
        self.date = nil
    }
}

class DetailRequest {
    //대상 --> 대상 VC에서 확인
    var person : String
    //세부 견적 --> 세부 견적 VC에서 확인
    var makingType : String
    var age : String
    var season : String
    var detailImage : UIImage? //파이어베이스에 있는 URL주소에서 String을 가지고 와서 UIImage(named:)로 처리
    //그럼 그 URL주소 받아오는건 다른 모델에서 스트링값을 받고, 그 값을 가지고 여기서 UIImage로 받음.
    var fabric : String
    //LastCheckVC에서 확인
    var memo : String = ""
    
    init() {
        self.person = ""
        self.makingType = ""
        self.age = ""
        self.season = ""
        //Image는 어떻게 추가해야할지 모르겠음
        self.fabric = ""
    }
    
    func defaultMemo(textViewText:String) -> () {
        if textViewText == "예) 신부 - 저고리 색깔을 더 연하게 하고 싶어요.\n시어머님 - 조끼를 추가하고 싶어요." {
            self.memo = "없음"
        } else {
            self.memo = textViewText
        }
    }
}

let user = User.getInstance


//person은 바로 request.person으로 접근
//var detailRequest : DetailRequest = DetailRequest() //--> 얘가 RequestTableViewController에 옵셔널로 선언되어 있고, LastCheckTVC에서 newRequest라는 메소드를 통해서 새로운 detailRequest 인스턴스를 생성해서 이 파일의 아래에 생성된 request 인스턴스에 추가되도록 하면 되지 않나?


// 그러면 user만 여기다가 전역변수로서 선언해놓고, detailRequest와 request 인스턴스는 모두 RequestTVC에다가 옵셔널로 선언을 해놔. 그러고 user에다가 request를 myrequest에 추가시키면 user에만 접근하면 되는거잖아? 오오오오!
//설마 이것때문에 싱글톤이 생긴건...가????

//최종 정리
// 여기다가 user만 선언해놓자. (user만 싱글톤으로 만들면 되지 않을까?
// detailRequest와 request는 모두 RequestTVC로 옮겨놓자 (optional로 선언)
// detailRequest를 DetailRequestTVC에서 다음 버튼을 클릭했을때 하나씩 추가되도록 선언.
//LastCheckTVC에서 버튼을 클릭시에 모달 디스미스와 함께 detailRequest 인스턴스를 하나 생성해놓 RequestTVC에 추가되도록ㅎ
