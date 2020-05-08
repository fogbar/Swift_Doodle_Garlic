//
//  NewsFeed.swift
//  copyJSON
//
//  Created by garlic on 2020/05/04.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import Foundation

struct NewsFeed : Codable {
    var status : String = ""
    var totalResults : Int = 0
    var articles : [Article]?
}
