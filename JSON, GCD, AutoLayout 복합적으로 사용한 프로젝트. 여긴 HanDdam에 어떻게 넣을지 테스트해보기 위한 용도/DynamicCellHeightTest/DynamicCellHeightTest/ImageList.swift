//
//  ImageList.swift
//  DynamicCellHeightTest
//
//  Created by garlic on 2020/05/25.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import Foundation

struct ImageList : Codable {
    let images : [Image]
}

struct Image : Codable {
    let url : String
}
