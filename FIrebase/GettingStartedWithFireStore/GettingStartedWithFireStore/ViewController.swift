//
//  ViewController.swift
//  GettingStartedWithFireStore
//
//  Created by garlic on 2020/10/23.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {
    
    var name:String = ""
    var phoneNum:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let db = Firestore.firestore()
        
        //참고 링크 " https://firebase.google.com/docs/firestore/quickstart#ios
       /*
        //db에 document 추가
        /*
        db.collection("users").addDocument(data: [
            "name": "상욱",
            "phoneNum": "01098765432"
        ], completion: { (err) in
            if let err = err {
                print(err)
            } else {
                print("hi")
            }
        })
        */
        
        //db에서 데이터 읽기
        db.collection("users").getDocuments { (shapshot, err) in
            if err != nil {
                print(err)
            } else {
                for document in shapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    
                    if let name = document.data()["name"] as? String, let phoneNum = document.data()["phoneNum"] as? String {
                        self.name = name
                        self.phoneNum = phoneNum
                        print(self.name)
                        print(self.phoneNum)
                    }
                }
            }
        }
    */
        
        //데이터 추가 심화
        //참고 링크 : https://firebase.google.com/docs/firestore/manage-data/add-data#swift
        
        
        
        
        
    }
}

