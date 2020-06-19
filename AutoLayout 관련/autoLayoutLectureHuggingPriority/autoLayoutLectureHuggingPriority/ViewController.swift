//
//  ViewController.swift
//  autoLayoutLectureHuggingPriority
//
//  Created by garlic on 2020/06/10.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var bottomStraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func changeBottomConstraint(_ sender: Any) {
        UIView.animate(withDuration: 0.6) {
            self.bottomStraint.isActive = !self.bottomStraint.isActive
            self.view.layoutIfNeeded() //즉시 반영해주네. Layout 변경된 것을
        }
    }
    
    
    
}

