//
//  POSYViewController.swift
//  getUserListTest
//
//  Created by garlic on 2020/06/28.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class POSYViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func postUserInfo(_ sender: UIButton) {
//        API.shared.postData(user: User(model: "oweie", pk: 2314, field: Field(name: "빡빡이", phoneNum: 01048573940))) {
//            self.navigationController?.popViewController(animated: true)
//        }
//        API.shared.postData2 {
//            self.navigationController?.popViewController(animated: true)
//        }
        API.shared.createPost(username: "빡빡이", password: "kwxc2278") { (err) in
            if let err = err {
                print("Occur err : ",err)
                return
            }
            print("Finished Creaing Post")
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
