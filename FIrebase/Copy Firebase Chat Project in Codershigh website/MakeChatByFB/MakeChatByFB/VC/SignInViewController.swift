//
//  SignInViewController.swift
//  MakeChatByFB
//
//  Created by garlic on 2020/05/11.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    let chatViewController = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func openChattingView() {
        performSegue(withIdentifier: "chattingRooms", sender: nil)
    }
    
    @IBAction func johnButtonTapped(_ sender:UIButton) {
        FirebaseDataService.instance.signIn(email: "myEmail@naver.com", password: "123456789") {
            self.openChattingView()
        }
    }

    @IBAction func parkButtonTapped(_ sender:UIButton) {
        FirebaseDataService.instance.signIn(email: "yourEmail@naver.com", password: "123456789") {
            self.openChattingView()
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
