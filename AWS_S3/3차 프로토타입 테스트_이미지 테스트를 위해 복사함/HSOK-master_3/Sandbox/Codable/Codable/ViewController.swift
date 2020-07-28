//
//  ViewController.swift
//  Codable
//
//  Created by DevKang on 2020/01/15.
//  Copyright © 2020 DevKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        API.shared.posts(completion: { posts in
           print(posts)
       })
    }


}

