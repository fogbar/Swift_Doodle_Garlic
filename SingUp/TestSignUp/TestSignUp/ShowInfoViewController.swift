//
//  ShowInfoViewController.swift
//  TestSignUp
//
//  Created by garlic on 2020/07/03.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class ShowInfoViewController: UIViewController {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //nicknameLabel.text = "nickname"
    }
    

    override func viewWillAppear(_ animated: Bool) {
        guard let nickname = UserDefaults.standard.string(forKey: "nickname") else {return}
        self.nicknameLabel.text = nickname
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
