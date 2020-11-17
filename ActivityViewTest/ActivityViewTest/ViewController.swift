//
//  ViewController.swift
//  ActivityViewTest
//
//  Created by garlic on 2020/09/14.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func go(_ sender: UIButton) {
        self.showSpinner()
        
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { (t) in
            self.removeSpinner()
        }
    }
    
}

