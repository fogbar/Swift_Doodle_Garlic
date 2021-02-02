//
//  Board.swift
//  UI_Zeplin
//
//  Created by 김동준 on 2021/01/09.
//

import Foundation

//Board 데이터 모델
struct Board: Hashable, Codable {
    var typeName: String
    var num: Int
    var image: String
    var background: String
}
