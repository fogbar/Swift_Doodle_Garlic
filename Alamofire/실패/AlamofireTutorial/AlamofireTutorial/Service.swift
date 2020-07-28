//
//  Service.swift
//  AlamofireTutorial
//
//  Created by garlic on 2020/06/26.
//  Copyright © 2020 com.codershigh. All rights reserved.
//
import Foundation
import Alamofire

class Service {
    //https://restcountries.eu/rest/v2/
    fileprivate var baseUrl:String = ""
    
    typealias countriesCallBack = (_ countries:[Country]?, _ status:Bool, _ message:String) -> Void
    
    var callBack : countriesCallBack?
    
    init(baseUrl:String) {
        self.baseUrl = baseUrl
    }
    
    //MARK:- getAllCountryNameFrom
    func getAllCountryNameFrom(endPoint:String) {
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).response { (responseData) in
            guard let data = responseData.data else {
                self.callBack?(nil, false, "")
                return}
            do {
                let countries = try JSONDecoder().decode([Country].self, from: data)
                self.callBack?(countries, true, "")
            } catch {
                self.callBack?(nil, false, error.localizedDescription)
            }
            
        }
    }
    
    func completionHandler(_ callBack:@escaping countriesCallBack) {
        self.callBack = callBack
    }
}
