//
//  SignUpViewController.swift
//  FBDemoTest
//
//  Created by garlic on 2020/05/06.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestoreSwift

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
    }
    
    func setUpElements() {
        
        //Hide the error Label
        errorLabel.alpha = 0
        
        //style the elements
        Utilites.styleTextField(firstNameTextField)
        Utilites.styleTextField(lastNameTextField)
        Utilites.styleTextField(emailTextField)
        Utilites.styleTextField(passwordTextField)
        Utilites.styleFilledButton(signUpButton)
    }
    
    //Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it returns the error message.
    func validateFields() -> String? {
        
        //check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        
        //If I need to check email, copy and modify below method.
        
        //check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilites.isPasswordValid(cleanedPassword) == false {
            //Password isn't secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        return nil
    }
    
    @IBAction func signUpTapped(_ sender: UIButton) {
        //Validate the fields
        let error = validateFields()
        
        if error != nil {
            
            //There's something wrong with the fields, show error message
            showError(error!)
            
        } else {
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                //check for errors
                if err != nil {
                    //There was an error creating the user
                    self.showError("error creating user")
                    
                } else {
                    
                    //User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstName":firstName, "lastName":lastName, "uid":result!.user.uid]) { (error) in
                        if error != nil {
                            //show error message
                            self.showError("Error saving user data")
                        }
                    }
                    //transition to the Home Screen
                    self.transitionToHome()
                }
            }
            //나는 안됨 ㅠㅜ permission이 충분하지 않아서, -> 공짜는 읽고 쓰는 것밖에 안된답니다 ㅜ
            
            
        }
        
        
    }
    
    func showError(_ message:String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
        let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }
    
    
}
