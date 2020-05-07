//
//  Movies.swift
//  CopyBoxOffice
//
//  Created by garlic on 2020/05/07.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import Foundation

struct MovieList : Codable {
    let movies : [MovieInfo]
}

struct MovieInfo : Codable {
    let grade : Int
    let thumb : String
    let reservationGrade : Int
    let title : String
    let reservationRate : Double
    let userRating : Double
    let date : String
    let id : String
    
    enum CodingKeys: String, CodingKey {
        case reservationGrade = "reservation_grade"
        case reservationRate = "reservation_rate"
        case userRating = "user_rating"
        case grade
        case thumb
        case title
        case date
        case id
    }
}
