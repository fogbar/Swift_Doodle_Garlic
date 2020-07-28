//
//  API.swift
//  TestSignUp
//
//  Created by garlic on 2020/07/03.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import Foundation
import Alamofire

typealias SignUpComponent = (id:String, password:String, nickname:String, phoneNumber:String)

class API {
    static let shared = API()
    private init() {}
    
    let baseUrlString = "http://127.0.0.1:8000"
    
    func singUp(with info: SignUpComponent, completionHandler: @escaping () -> Void) {
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
        //4. user 인스턴스를 json 데이터로 serialize 합시다.
//        let data = try! JSONSerialization.data(withJSONObject: user, options: JSONSerialization.WritingOptions.prettyPrinted)
//        let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
//        if let json = json {
//            print(json)
//        }
        request.httpBody = jsonBody//json?.data(using: String.Encoding.utf8.rawValue)
        //5. Alamofire를 통해 post 시도
        AF.request(request as URLRequestConvertible).responseJSON { (response) in
            //6. post가 됐다면 response를 받음
            switch response.result {
            case .success(let obj): //대체 이 받아오는 결과값이 뭔지 모르겠어. (어떤 값을 받아오는지 모르겠어)
                //7. response를 dictionary 형태로 downcasting 시킨 후 얻고자 하는 token 값을 얻어냄
                //생각을 해보니까 유저의 nickname을 바로 UI로 업데이트를 시켜주야하니 token값 뿐만 아니라 nickname도 함께 얻어와야 함.
                guard let dict = obj as? NSDictionary else {return}
                guard let token = dict["token"] as? String else {return}
                guard let nickname = dict["user_nickname"] as? String else {return}
                //8. token을 UserDefaults에 저장
                UserDefaults.standard.set(token, forKey: "token")
                UserDefaults.standard.set(nickname, forKey: "nickname")
                
                completionHandler()
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
