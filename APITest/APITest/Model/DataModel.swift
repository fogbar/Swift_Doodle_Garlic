//
//  DataModel.swift
//  APITest
//
//  Created by 김동준 on 2020/12/16.
//

import Foundation

//post, get 할 때 모두 똑같은 모델이라고 생각하고 struct 하나만 만듬.

struct Model : Codable {
    let category: String
    let phoneNum:String
    let name : String
    
    enum Codingkeys: String, CodingKey {
        case category, phoneNum, name
    }
}

