//
//  UserModel.swift
//  TestSignUp
//
//  Created by garlic on 2020/07/03.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import Foundation

struct User:Codable {
    let id:String
    let password:String
    let nickname:String
    let phoneNumber:String
    
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
