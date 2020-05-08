//
//  ViewController.swift
//  copyJSON
//
//  Created by garlic on 2020/05/04.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Mark : Test JSON API
        
        let urlString = "http://newsapi.org/v2/everything?q=bitcoin&from=2020-04-04&sortBy=publishedAt&apiKey=API_KEY"
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, err) in
            
            //check for error
            if err == nil && data != nil {
                //parse json
                let decoder = JSONDecoder()
                
                do {
                    
                    let newsFeed = try decoder.decode(NewsFeed.self, from: data!)
                    
                    print(newsFeed)
                }
                catch {
                    print("error")
                }
                
            }
            
        }
        
        dataTask.resume()
        
    }


}

