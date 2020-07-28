//
//  Post.swift
//  SPMAndCodable
//
//  Created by DevKang on 2020/01/15.
//  Copyright © 2020 DevKang. All rights reserved.
//

import Foundation

struct Post: Codable {
    var id: Int
    var postTitle: String
    var author: String
//    var created: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case postTitle = "title"
        case author
//        case created
    }
}







