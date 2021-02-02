//
//  Model.swift
//  Breweies
//
//  Created by 김동준 on 2021/01/06.
//

import Foundation



struct Brewery : Hashable, Codable {
    let name: String
    let street: String
    let city: String
}
