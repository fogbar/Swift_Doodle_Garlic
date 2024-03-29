//
//  SignUpViewController.swift
//  HanDdam
//
//  Created by garlic on 2020/07/06.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit

//textField 키보드 처리시 참고 링크 : https://baked-corn.tistory.com/38

class SignUpViewController: UIViewController {
    //MARK:- IBOutlets
    //최상위 label
    @IBOutlet weak var explainLabel: UILabel!
    //TextFields
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var doneBtn: UIButton!
    
    //MARK:- ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        explainLabel.text = "아래의 간단한 로그인을 하시면 상인분들께 견적을 요청하고, 응답 받을 수 있습니다."
            
        doneBtn.layer.cornerRadius = 8.0
        //keyboard가 textField를 가리지 않기 위해 올라오기 위함. -> 굳이 구현할 필요는 없을 듯
//        idTextField.delegate = self
//        passwordTextField.delegate = self
//        nicknameTextField.delegate = self
//        phoneNumberTextField.delegate = self
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK:- IBActions
    //회원가입하는 action
    @IBAction func ClickCreateAccountBtn(_ sender: UIButton) {
        guard let id = idTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        guard let nickname = nicknameTextField.text else {return}
        guard let phoneNumber = phoneNumberTextField.text else {return}
        
        API.shared.singUpAndIn(with: (id, password, nickname, phoneNumber)) {
//            guard let token = UserDefaults.standard.string(forKey: "token") else {
//                return
//            }
            //로그인 상태를 여기서 true로 바꿈으로서 앞으로는 바로 세부견적 작성 뷰를 띄울 수 있도록 함.
            loggedIn = true
            UserDefaults.standard.set(loggedIn, forKey: "login_state")
            self.dismiss(animated: true, completion:nil)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func dismissSignUpVC(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
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

//extension SignUpViewController : UITextFieldDelegate {
//    @objc func keyboardWillShow(_ sender: Notification) {
//        self.view.frame.origin.y = -150
//    }
//
//    @objc func keyboardWillHide(_ sender: Notification) {
//        self.view.frame.origin.y = 0
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//}
