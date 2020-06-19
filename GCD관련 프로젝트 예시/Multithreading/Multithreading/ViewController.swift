//
//  ViewController.swift
//  Multithreading
//
//  Created by garlic on 2020/05/19.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            print("3")
        }
        print("1")
        
        DispatchQueue.main.async {
            print("4")
        }
        print("2")
        
        DispatchQueue.main.async {
            print("5")
        }
        
        //mainQueue is Serial.
        //Although occur asyncronously it will print it like "1 2 3 4 5"
    }
    
    
    
    
}

