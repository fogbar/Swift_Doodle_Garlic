//
//  ViewController.swift
//  FBDemoTest
//
//  Created by garlic on 2020/05/05.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    
    func setUpElements() {
        Utilites.styleFilledButton(signUpButton)
        Utilites.styleHollowButton(signInButton)
    }

}

