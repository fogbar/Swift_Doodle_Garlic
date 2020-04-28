//
//  MakeMemeVC.swift
//  Pachinko
//
//  Created by 김동준 on 2020/04/03.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

let myListKey = "myList"

class MakeMemeVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var picerkImageView: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var showTextLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var deliveredImage : UIImage?
    var wordOfLabel1 : String = ""
    var wordOfLabel2 : String = ""
    var userInput : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picerkImageView.image = deliveredImage
        self.label1.text = wordOfLabel1
        self.label2.text = wordOfLabel2
        
        showTextLabel.text = "여기는 당신이 쓴게 보이는 곳이다ㅏㅏㅏ"
        showTextLabel.textAlignment = .center
        showTextLabel.layer.borderWidth = 1.0
        showTextLabel.layer.borderColor = CGColor(srgbRed: 45/255, green: 105/255, blue: 26/255, alpha: 1.0)
        
        textField.text = "당신의 센스를 보여주세요😆"
        textField.delegate = self
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWilllShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
        
       // load()
    }
    
//    func load() {
//        if let data = UserDefaults.standard.object(forKey: myListKey) as? Data {
//            myList = try! PropertyListDecoder().decode([SelectedComponent].self, from: data)
//        }
//    }
    
//    func load() {
//        guard let encodedData = UserDefaults.standard.array(forKey: myListKey) as? Data else {return}
//        myList = NSKeyedUnarchiver.unarchiveObject(with: encodedData) as! [SelectedComponent]
//    }
    
    @objc func keyboardWilllShow(_ sender: Notification) {
        self.view.frame.origin.y = -230
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }
    
    @IBAction func dismissView(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goToVC(_ sender: UIButton) {
        makeMeme()
        myList.append(selectedComponent)
        //save()
        //performSegue(withIdentifier: "MainSegue", sender: self) -> UnwindToSegue를 통한 복귀
        self.presentingViewController?.dismiss(animated: true) //-> 뷰의 계층구조에 의한 복귀
        //        self.presentingViewController?.dismiss(animated: true, completion: {
        //            self.presentingViewController?.performSegue(withIdentifier: "openMyListTVC", sender: self)
        //        })
        //어떻게 myListView 띄울지 생각하기 -> completionHandler로 한 번 해보고 안되면 그냥 이대로 하기
        print(myList)
        //
    }
    
//    func save() {
//        UserDefaults.standard.set(try? PropertyListEncoder().encode(myList), forKey: myListKey)
//    }
    
//    func save() {
//        let encodedData = NSKeyedArchiver.archivedData(withRootObject: myList, requiringSecureCoding: false)
//        UserDefaults.standard.set(encodedData, forKey: myListKey)
//    }
    
    func makeMeme() {
        selectedComponent.selectedimage = deliveredImage
        selectedComponent.selectedword1 = wordOfLabel1
        selectedComponent.selectedword2 = wordOfLabel2
        selectedComponent.userSentence = userInput
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        showTextLabel.text = self.textField.text
        userInput = showTextLabel.text!
        print(selectedComponent)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
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


