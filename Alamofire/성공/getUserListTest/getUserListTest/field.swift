//
//  field.swift
//  getUserListTest
//
//  Created by garlic on 2020/06/26.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import Foundation

struct UserList:Codable {
    let data:[User]
    
    enum CodingKeys:String, CodingKey {
        case data = "userList"
    }
}

struct User:Codable {
    let model:String
    let pk:Int
    let field:Field
    
    enum CodingKeys:String, CodingKey {
        case model = "model"
        case pk = "pk"
        case field = "fields"
    }
}

struct Field:Codable {
    let name:String
    let phoneNum:Int?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case phoneNum = "phoneNum"
    }
}
