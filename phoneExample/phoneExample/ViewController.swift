//
//  ViewController.swift
//  phoneExample
//
//  Created by garlic on 2020/06/22.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit
import MessageUI

var phoneNumber = ""

class MessageComposer: NSObject, MFMessageComposeViewControllerDelegate {
    
    func canSendText() -> Bool {
        return MFMessageComposeViewController.canSendText()
    }
    
    func configuredMessageComposeViewController() -> MFMessageComposeViewController {
        let messageComposeVC = MFMessageComposeViewController()
        messageComposeVC.messageComposeDelegate = self
        messageComposeVC.recipients = [phoneNumber]
        messageComposeVC.body = ""
        return messageComposeVC
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
}

class ViewController: UIViewController {
    
    

    let messageComposer = MessageComposer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let car = Car()
        car.perform(NSSelectorFromString("drive"))
        
    }
    
    @IBAction func touchBtn1(_ sender: UIButton) {
        
    }
    
    @IBAction func touchBtn2(_ sender: UIButton) {
        phoneNumber = "01036117587"
    }
    
    @IBAction func callToSomeone(_ sender: UIButton) {
        //전화걸기 테스트
//        if let phoneCallURL = URL(string: "tel://\(self.phoneNumber)") {
//            let application:UIApplication = UIApplication.shared
//            if (application.canOpenURL(phoneCallURL)) {
//                application.open(phoneCallURL, options: [:], completionHandler: nil)
//            }
//
//        }
        //메시지 보내기 테스트
        if messageComposer.canSendText() {
            let messageComposerVC = messageComposer.configuredMessageComposeViewController()
            present(messageComposerVC, animated: true, completion: nil)
        } else {
            print("메시지를 보낼 수 없습니다.")
        }
    }
    
}

