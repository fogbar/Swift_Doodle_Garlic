//
//  User.swift
//  HanDdamUserAlamofireTest
//
//  Created by garlic on 2020/06/26.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import Foundation

class Root:Decodable {
    let userList:[User]
    
    init() {
        self.userList = []
    }
}

class User:Decodable {
    let model:String
    let pk:Int
    let field:Field
}

class Field:Decodable {
    let name:String
    let phoneNum:Int?
}
