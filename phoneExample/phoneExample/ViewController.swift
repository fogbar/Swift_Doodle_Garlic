//
//  ViewController.swift
//  phoneExample
//
//  Created by garlic on 2020/06/22.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var phoneNumber = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func touchBtn1(_ sender: UIButton) {
        self.phoneNumber = "01022390349"
    }
    
    @IBAction func touchBtn2(_ sender: UIButton) {
        self.phoneNumber = "01036117587"
    }
    
    @IBAction func callToSomeone(_ sender: UIButton) {
        if let phoneCallURL = URL(string: "tel://\(self.phoneNumber)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
            
        }
    }
    
}

