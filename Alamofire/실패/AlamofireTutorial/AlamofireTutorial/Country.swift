//
//  Country.swift
//  AlamofireTutorial
//
//  Created by garlic on 2020/06/26.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import Foundation

struct Country:Decodable {
    var name : String?
    var capital : String?
    var countryCode:String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case capital = "capital"
        case countryCode = "alpha3Code"
    }
}
