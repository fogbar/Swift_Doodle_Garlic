//
//  API.swift
//  APITest
//
//  Created by 김동준 on 2020/12/16.
//

import Foundation
import Alamofire

//typealias postParam = (category:String, phoneNum:String, name:String)

class API {
    static let shared = API()
    
    let baseUrl = "" //<- 여따가 baseUrl 적어
    
    //post하는 함수
    func post(_ model: Model, completionHandler: @escaping () -> Void) {
        //1.전송할 데이터
        guard let jsonBody = try? JSONEncoder().encode(model) else {return}
        //2. 보낼 서버 위치
        let endPoint = "/Model" //-> endPoint는 restfulApi 통신일떄만
        guard let url = URL(string: baseUrl + endPoint) else {return}
        var urlRequest = URLRequest(url: url)
        //3. request setting
        urlRequest.method = .post
        urlRequest.httpBody = jsonBody
        //4. request Header 작성
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //5. post 시도
        //받아오는게 status 코드이기 때문에 response 사용. 이건 서버에서 보내주는 response에 따라 알아서 변경
        AF.request(urlRequest as URLRequestConvertible).response { (response) in
            //response의 status 코드가 200 즉, 통신 성공했다면 completionHandler가 실행. 만약 post 후에 딱히 해줄게 없다면 parameter에 있는 completionHandler와 .success에서 실행되는 completionHandler() 모두 지워도 됨. 일단 나는 post 후에 push로 GetVC으로 넘어가도록 해놈
            switch response.result {
            case .success:
                completionHandler()
            case .failure(let err):
                print(err)
            }
        }
    }
    
    //get하는 함수
    func get(completionHandler: @escaping (Model) -> Void) {
        let endPoint = ""
        guard let url = URL(string: baseUrl + endPoint) else {return}
        
        //받아오는게 json 형태이기 때문에 responseJSON을 사용
        AF.request(url).responseJSON { (responseData) in
            guard let data = responseData.data else {return}
            do {
                let model = try JSONDecoder().decode(Model.self, from: data)
                completionHandler(model)
            }
            catch let err {
                print("Err : \(err)")
            }
        }
    }
}
