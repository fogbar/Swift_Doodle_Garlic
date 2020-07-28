//
//  API.swift
//  HanDdamUserAlamofireTest
//
//  Created by garlic on 2020/06/26.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import Foundation
import Alamofire

class API {
    static let shared = API()
    
    fileprivate let baseUrl:String = "http://127.0.0.1:8000/"
    
    //MARK:- getUserList
    func getUserList(endPoint:String, completionHandler: @escaping (Root) -> Void) {
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).response { (responseData) in
            guard let data = responseData.data else {return}
            do {
                let userList = try JSONDecoder().decode(Root.self, from: data)
                print(userList)
                completionHandler(userList)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
