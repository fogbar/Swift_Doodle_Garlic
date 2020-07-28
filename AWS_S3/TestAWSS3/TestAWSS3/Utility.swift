//
//  Utility.swift
//  TestAWSS3
//
//  Created by garlic on 2020/07/20.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import Foundation

extension String {
    func between(_ left:String, _ right:String) -> String? {
        guard let leftRange = range(of: left), let rightRange = range(of: right, options: .backwards), leftRange.upperBound <= rightRange.lowerBound else {return nil}
        
        let sub = self[leftRange.upperBound...]
        let closestToLeftRange = sub.range(of: right)!
        
        return String(sub[..<closestToLeftRange.lowerBound])
    }
    
    func fromStringToEnd(_ left:String) -> String? {
        guard let leftRange = range(of: left) else {return nil}
        let sub = self[leftRange.upperBound...]
        return String(sub)
    }
}


extension StringProtocol {
    func index(of string:Self, options:String.CompareOptions = []) -> Index? {
        return range(of: string, options: options)?.lowerBound
    }
    
    func endIndex(of string:Self, options:String.CompareOptions = []) -> Index? {
        return range(of: string, options: options)?.upperBound
    }
}

//extension
