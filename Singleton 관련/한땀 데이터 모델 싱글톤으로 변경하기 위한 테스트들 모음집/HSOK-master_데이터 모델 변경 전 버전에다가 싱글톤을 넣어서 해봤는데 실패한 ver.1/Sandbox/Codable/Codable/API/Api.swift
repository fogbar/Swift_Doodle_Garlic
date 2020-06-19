//
//  Api.swift
//  SPMAndCodable
//
//  Created by DevKang on 2020/01/15.
//  Copyright © 2020 DevKang. All rights reserved.
//

import Foundation
import Alamofire

class API: NSObject {
    static let shared = API()
    
    func posts(completion: @escaping ([Post]) -> Void) {
        Alamofire.request("https://json-mock-server.herokuapp.com/posts/", method: .get).responseData { response in
            if let data = response.data {
                let decoder = JSONDecoder()
//                decoder.dateDecodingStrategy = .iso8601
                if let posts = try? decoder.decode(Array<Post>.self, from: data) {
                    completion(posts)
                }
            }
//            // Enum Associated Value 사용
//            switch response.result {
//            case .success(let data):
//                let decoder = JSONDecoder()
//                if let posts = try? decoder.decode(Array<Post>.self, from: data) {
//                    completion(posts)
//                }
//            case .failure:
//                break
//            }
        }
    }
}
