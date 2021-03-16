//
//  GetVC.swift
//  APITest
//
//  Created by 김동준 on 2020/12/16.
//

import UIKit

class GetVC: UIViewController {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var phoneNumLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        API.shared.get() { (model) in
            
            self.categoryLabel.text = model.category
            self.phoneNumLabel.text = model.phoneNum
            self.nameLabel.text = model.name
            
        }
    }

}
