//
//  API.swift
//  getUserListTest
//
//  Created by garlic on 2020/06/26.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import Foundation
import Alamofire

// 자 나는 GET, POST, PUT, DELETE를 다 해야함. 고냥 뭐 RESTApi를 야무지게 써먹어야죠?
// 1. GET : 서버로 부터 정보를 가져오는 것
// 2. POST : 서버에 새로운 정보 생성.
// 3. PUT : 서버에 존재하는 데이터들을 수정하고 업데이트 하는 용도
// 4. DELETE : 데이터를 삭제

class API {
    static let shared = API()
    
    //MARK:- Getting data
    
    // Using URLSession
    //    func getData(completionHandler: @escaping (UserList) -> Void) {
    //let urlString : String = "http://127.0.0.1:8000/HanDdam/"
    //        guard let url = URL(string: urlString) else {return}
    //        URLSession.shared.dataTask(with: url) { (data, response, err) in
    //            guard let data = data else {return}
    //            print(data)
    //            do {
    //                let userList = try JSONDecoder().decode(UserList.self, from: data)
    //                print(userList)
    //                completionHandler(userList)
    //            } catch let err {
    //                print("\nErr", err)
    //            }
    //        }.resume()
    //    }
    
    //Using Alamofire
    func getData2(completionHandler: @escaping (UserList) -> Void) {
        let urlString : String = "http://127.0.0.1:8000/HanDdam/posts/"
        guard let url = URL(string: urlString) else {return}
        AF.request(url).response { (responseData) in
            guard let data = responseData.data else {return}
            do {
                let userList = try JSONDecoder().decode(UserList.self, from: data)
                print(userList)
                completionHandler(userList)
            } catch let err {
                print("\nErr", err)
            }
        }
    }
    
    //MARK:- Post data
    // Using URLSession -> Post 성공. 다만 Postman 내부적으로도 post를 해줘야되네. 워호우.
    //        func postData(user:User, completionHandler: @escaping () -> Void) {
    //            //데이터 생성
    //            let user = user
    //            guard let uploadData = try? JSONEncoder().encode(user) else {return}
    //            //url Reqeust 생성
    //            let urlString : String = "http://127.0.0.1:8000/HanDdam/"
    //            guard let url = URL(string: urlString) else {return}
    //            var request = URLRequest(url: url)
    //            request.httpMethod = "POST"
    //            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    //            //create and start an Upload Task
    //            let task = URLSession.shared.uploadTask(with: request, from: uploadData) { (data, response, error) in
    //                if let error = error {
    //                    print("error: \(error)")
    //                    return
    //                }
    //
    //                guard let response = response as? HTTPURLResponse else {
    //                    print("server error")
    //                    return
    //                }
    //
    //                if let mimeType = response.mimeType, mimeType == "application/json", let data = data, let dataString = String(data: data, encoding: .utf8) {
    //                    print("got data: \(dataString)")
    //                }
    //            }
    //            task.resume()
    //        }
    
    //Using Alamofire
     //알라모파이어로 Post 하는 법 알아내기
        func postData2(completionHandler: @escaping () -> Void) {
            let user : [String:Any] =
                [
                "model":"HanDdam.user",
                "pk":18,
                "fields":[
                    "name":"빡빡이",
                    "phoneNum":01054324359
                ]
            ]
            //현재 발생하는 Thread 1: Exception: "*** +[NSJSONSerialization dataWithJSONObject:options:error:]: Invalid top-level type in JSON write" 이 오류가 내 생각에는 user를 바꿔서 그런 것 같네.. 한번 JSON 타입으로 하나 만들어서 시도해보자. 그럼 될 것 같음.
            let urlString : String = "http://127.0.0.1:8000/HanDdam/"
            guard let url = URL(string: urlString) else {return}
            //let request = NSMutableURLRequest(url: url)
            var request = URLRequest(url: url)
            request.httpMethod = HTTPMethod.post.rawValue
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            //guard let uploadData = try? JSONEncoder().encode(user) else {return}
            let data = try! JSONSerialization.data(withJSONObject: user, options: JSONSerialization.WritingOptions.prettyPrinted)
            let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            if let json = json {
                print(json)
            }
            request.httpBody = json?.data(using: String.Encoding.utf8.rawValue)
    
    
            AF.request(request as URLRequestConvertible).responseJSON { (response) in
                print(response.request as Any)
                print(response.response as Any)
                print(response.data as Any)
                print(response.result)
            }
            completionHandler()
        }
    
    //Post Using AF
    func createPost(username:String, password:String, completionHandler: @escaping (Error?) -> Void) {
        guard let url = URL(string: "http://127.0.0.1:8000/HanDdam/token/") else {
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        
        let params = ["username":username, "password":password]
        do {
            let data = try JSONSerialization.data(withJSONObject: params, options: .init())
            
            urlRequest.httpBody = data
            urlRequest.setValue("application/json", forHTTPHeaderField: "content-type")
            
            URLSession.shared.dataTask(with: urlRequest) { (data, response, err) in
                guard let data = data else {return}
                print(String(data: data, encoding: .utf8))
                //if let token = response.body

                completionHandler(nil)

            }.resume()
//            AF.request(urlRequest).responseJSON { (responseData) in
//                if let data = responseData.data {
//                    print(data)
//                }
//                if let response = responseData.response {
//                    print(response)
//                }
//                if let request = responseData.request {
//                    print(request)
//                }
//                print(responseData.result)
//                completionHandler(nil)
//            }
            
            
        } catch {
            completionHandler(error)
        }
    }
}
