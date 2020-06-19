//
//  TestBtnViewController.swift
//  PdfTest
//
//  Created by 김동준 on 2020/03/30.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class TestBtnViewController: UIViewController {

    @IBOutlet weak var one: UIButton!
    
    @IBOutlet weak var two: UIButton!
    
    @IBOutlet weak var three: UIButton!
    
    
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        one.isMultipleTouchEnabled = false
        two.isMultipleTouchEnabled = false
        three.isMultipleTouchEnabled = false
        
        one.isExclusiveTouch = true
        two.isExclusiveTouch = true
        three.isExclusiveTouch = true
    }
    
    @IBAction func touchBtn(_ sender: UIButton) {
        
        if sender == one {
            two.isEnabled = false
            three.isEnabled = false
            label.text = "1"
        } else if sender == two {
            one.isEnabled = false
            three.isEnabled = false
            label.text = "2"
        } else {
            two.isEnabled = false
            one.isEnabled = false
            label.text = "3"
        }
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
