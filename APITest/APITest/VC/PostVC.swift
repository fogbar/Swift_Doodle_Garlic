//
//  PostVC.swift
//  APITest
//
//  Created by 김동준 on 2020/12/16.
//

import UIKit

class PostVC: UIViewController {
    
    @IBOutlet weak var postBtn: UIButton!
    
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var phoneNumTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //post 버튼의 basci configuration
        self.postBtn.layer.borderWidth = 3.0
        self.postBtn.layer.borderColor = CGColor(red: 0.49, green: 0.40, blue: 0.20, alpha: 1.00)
        
    }
    
    //post 함수를 실행할 btn의 액션
    @IBAction func clickPostBtn(_ sender: UIButton) {
        //각 textField에서 작성하면 text 들어오는거 확인
        guard let categoryText = self.categoryTextField.text else {return}
        guard let phoneNumText = self.phoneNumTextField.text else {return}
        guard let nameText = self.nameTextField.text else {return}
        
        let model:Model = Model(category: categoryText, phoneNum: phoneNumText, name: nameText)
        
        API.shared.post(model) {
            //여기서 completionHandler가 실행됨
            //GetVC으로 넘어감
            self.performSegue(withIdentifier: "goToGetVC", sender: self)
        }
    }

}
