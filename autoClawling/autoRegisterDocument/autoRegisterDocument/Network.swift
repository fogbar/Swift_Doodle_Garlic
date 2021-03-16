//
//  Network.swift
//  autoRegisterDocument
//
//  Created by 김동준 on 2021/02/05.
//

import Foundation
import SwiftSoup
import Kanna


//func fetchHTMLParsingResultWill(completion: @escaping () -> ()) {
//
//    let urlAddress = "https://www.institutfrancais-seoul.com/ko/2017-%eb%ac%b8%ed%99%94-%ea%b5%90%ec%9c%a1-%ea%b3%bc%ed%95%99-%eb%89%b4%ec%8a$a4/"
//
//    guard let url = URL(string: urlAddress) else {return}
//    do {
//        let html = try String(contentsOf: url, encoding: .utf8)
//        let doc: Document = try SwiftSoup.parse(html)
//
//        let firstLinkTitles : Elements = try doc.select("div#av-masonry-1").select(<#T##query: String##String#>)
//    } catch let err {
//        print("Error: \(err)")
//    }
//}

func get() {
    let mainURL = "https://www.kaggle.com/volpatto/coffee-quality-database-from-cqi"
    guard let main = URL(string: mainURL) else {
        print("Error: \(mainURL) doesn't seem to be a valid URL")
        
        return
    }
    do {
        
        let bestSeller = try String(contentsOf: main, encoding: .utf8)
        
        let doc = try HTML(html: bestSeller, encoding: .utf8)
        for product in doc.xpath("//div[@class='sc-jxSJjv sc-kIYdVI bOvXgN']") {
            if let productURL = product.at_xpath("a/strong"){
                if let schedule = productURL.text, schedule.contains("[") {
                    print(schedule)
                }
            }
        }
    } catch let error {
        print("Error: \(error)")
        
    }
}

