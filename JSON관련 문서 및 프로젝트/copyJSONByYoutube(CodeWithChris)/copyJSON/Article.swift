//
//  Article.swift
//  copyJSON
//
//  Created by garlic on 2020/05/04.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import Foundation

struct Article : Codable {
    
    var author : String?
    var title : String?
    var description : String?
    var url : String?
    var urlToImage: String?
    var publishedAt : String?
    var content : String?
    
}
