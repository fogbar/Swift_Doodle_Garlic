//
//  API.swift
//  HanDdam
//
//  Created by 김동준 on 2020/01/30.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import Foundation


//Singleton
//뷰 컨트롤러 자체내에서 데이터를 접근하지 않고 모든 뷰 컨트롤러에서 이 하나에 데이터를 보내면 모든 컨트롤러에서 데이터를 받을 수 있음,

/*
class API {
    static let shared = API()
    
    func hello() -> [String] {
        return [
            "hello",
            "world"
        ]
    }
}
*/
 
 
//이것도 좋지만 일단은 Programmers 강의 처럼 옛날 방식으로 데이터 전달을 하자!
