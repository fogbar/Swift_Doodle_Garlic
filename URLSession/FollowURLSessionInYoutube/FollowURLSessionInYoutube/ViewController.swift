//
//  ViewController.swift
//  FollowURLSessionInYoutube
//
//  Created by garlic on 2020/06/30.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getJsonUserData()
    }

    func getJsonUserData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                return
            }
            
            if let response = response {
                print(response)
            }
            
            if let data = data {
                print(data)
//                let userList = try? JSONDecoder().decode(User.Self, from: data)
            }
        }.resume()
    }
}

