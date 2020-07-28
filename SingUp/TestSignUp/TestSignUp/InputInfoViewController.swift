//
//  InputInfoViewController.swift
//  TestSignUp
//
//  Created by garlic on 2020/07/03.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class InputInfoViewController: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func postUserinfo(_ sender: UIButton) {
        guard let id = idTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        guard let nickname = nicknameTextField.text else {return}
        guard let phoneNumber = phoneNumberTextField.text else {return}
        
        API.shared.singUp(with: (id, password, nickname, phoneNumber)) {
            //9. userDefault에 있는 token 값과 유저 정보를 함께 얻어옴.
            //받아온 token값은 저장을 시켜놓고 앞으로 회원이 request를 만들때 항상 header에 같이 보내는 식으로 하면 됨.
            guard let token = UserDefaults.standard.string(forKey: "token") else {
                return
            }
            self.dismiss(animated: true, completion: nil)
            
            
            //10. 얻어낸 token 값을 segue를 통해 전달 시키기. -> segue를 만들기
            //token 값이 id 와 비밀번호를 암호화 시킨 것이기 때문에 token만 전달시키면 된다.
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
