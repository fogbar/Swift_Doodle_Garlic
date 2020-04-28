//
//  ViewController.swift
//  SegmentViewSwitch
//
//  Created by LingoStar on 2020/03/25.
//  Copyright © 2020 LingoStar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableEmbedView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeSeg(_ sender: UISegmentedControl) {

        let tableVC = self.children.first as! MyTableViewController
        tableVC.changeDataSet(sender.selectedSegmentIndex)
      
        
    }
    
}

