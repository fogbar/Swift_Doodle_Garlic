//
//  SignInViewController.swift
//  FBDemoTest
//
//  Created by garlic on 2020/05/06.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
    }
    
    func setUpElements() {
         errorLabel.alpha = 0
        
         Utilites.styleTextField(firstNameTextField)
         Utilites.styleTextField(lastNameTextField)
         Utilites.styleFilledButton(signInButton)
    }
    
    @IBAction func signInTapped(_ sender: UIButton) {
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
