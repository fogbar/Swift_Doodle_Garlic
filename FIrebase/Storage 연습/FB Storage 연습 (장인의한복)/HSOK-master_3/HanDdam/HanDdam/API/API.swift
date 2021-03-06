//
//  API.swift
//  HanDdam
//
//  Created by 김동준 on 2020/01/30.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import Foundation
import Alamofire
//import AlamofireImage
import Kingfisher

//회원가입시 필요한 매개변수들
typealias SignUpComponent = (id:String, password:String, nickname:String, phoneNumber:String)
//로그인 여부 판단
var loggedIn:Bool = false

class API {
    static let shared = API()
    
    let baseUrlString = "http://127.0.0.1:8000"
    
    // MARK: - Function to Sign Up
    func singUpAndIn(with info: SignUpComponent, completionHandler: @escaping () -> Void) {
        //1. User 인스턴스 생성 및 SignUpComponent 매개변수를 통해 textField에 있는 값들을 User 인스턴스에 전달시킨다.(여기서 Encoding을 시켜야 하는 것은 아닌가?)
        let user = User(info: info) //-> 서버에 POST시킬 데이터
        guard let jsonBody = try? JSONEncoder().encode(user) else {return}
        //2. urlRequest를 endPoint를 통해 생성
        let endPoint = "/user"
        guard let url = URL(string: baseUrlString + endPoint) else {return}
        var request = URLRequest(url: url)
        //3. request setting
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //4. user 인스턴스를 json 데이터로 serialize 합시다. (Serialize를 JsonEncoder로 대신!)
        request.httpBody = jsonBody//json?.data(using: String.Encoding.utf8.rawValue)
        //5. Alamofire를 통해 post 시도
        AF.request(request as URLRequestConvertible).responseJSON { (response) in
            //6. post가 됐다면 response를 받음
            switch response.result {
            case .success(let obj):
                //7. response를 dictionary 형태로 downcasting 시킨 후 얻고자 하는 token과 nickname 값을 얻어냄
                guard let dict = obj as? NSDictionary else {return}
                guard let token = dict["token"] as? String else {return}
                guard let nickname = dict["user_nickname"] as? String else {return}
                guard let userId = dict["user_id"] as? String else {return}
                //8. token, nickname을 UserDefaults에 저장
                UserDefaults.standard.set(token, forKey: "token")
                UserDefaults.standard.set(nickname, forKey: "nickname")
                //user_id를 저장해놓는 이유는 나중에 requests에서 request parameter로 헤더에 user_id를 보내기 위함
                UserDefaults.standard.set(userId, forKey: "user_id")
                
                completionHandler()
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    // MARK:- postRequest 함수
    //유저가 신청한 요청견적 서버에 올리기
    func postRequest(with request:RequestToServer, completionHandler:@escaping () -> Void) {
        //1. 전송할 데이터
        guard let jsonBody = try? JSONEncoder().encode(request) else {return}
        //2. 보낼 서버 위치
        let endPoint = "/requests/"
        guard let url = URL(string: baseUrlString + endPoint) else {return}
        var urlRequest = URLRequest(url: url)
        //3. request setting
        urlRequest.method = .post
        urlRequest.httpBody = jsonBody
        //4. request header 작성
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let token = UserDefaults.standard.string(forKey: "token") else {return}
        urlRequest.addValue(token, forHTTPHeaderField: "Authorization")
        //5. post 시도
        //Json 형식을 받아오는게 아니기 때문에 responseJson이 아닌 response를 사용
        AF.request(urlRequest as URLRequestConvertible).response { (response) in
            switch response.result {
            case .success:
                completionHandler()
            case .failure(let err):
                print(err)
            }
        }
    }
    
    // MARK: - 서버 통신전 request 생성 함수
//
//    var fakeRequests:[DetailRequest] = []
//    //detailRequest를 fakeRequests에다가 추가할 함수
//    func createPost(detailRequest:DetailRequest, completionHandelr:@escaping () -> Void) {
//
//        fakeRequests.append(detailRequest)
//        completionHandelr()
//    }
//
//    //fakeRequests를 User 인스턴스의 myRequests에 추가할 함수
//    func posts(completionHandler:@escaping ([DetailRequest]) -> Void) {
//
//        completionHandler(fakeRequests)
//    }
    
    
    //MARK:- AlamofireImage
//    func getImage(with imageUrl:String, completionHandler:@escaping (Image) -> Void) {
//        AF.request(imageUrl).responseImage { (response) in
//            switch response.result {
//            case .success(let image):
//                completionHandler(image)
//            case .failure(let err):
//                print("Err: \(err)")
//            }
//        }
//    }
    
//    func getImage(with imageUrl:String, completionHandler:@escaping (Image) -> Void) {
//        guard let url = URL(string: imageUrl) else {return}
//        
//    }
}



