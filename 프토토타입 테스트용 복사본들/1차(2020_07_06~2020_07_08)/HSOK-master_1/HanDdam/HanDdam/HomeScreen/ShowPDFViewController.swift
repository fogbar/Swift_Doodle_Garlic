//
//  ShowPDFViewController.swift
//  HanDdam
//
//  Created by 김동준 on 2020/03/27.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit
import WebKit

class ShowPDFViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    //let backButton : UIButton = UIButton(type: .custom)
    
    var targetURL : URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let targetURL = targetURL else {return}
        let request = URLRequest(url: targetURL)
        webView.load(request)
        
        //initBackButton()
        
        //webView.addSubview(backButton)
    }
//
//    func initBackButton() {
//        self.view.addSubview(backButton)
//        backButton.layer.cornerRadius = 15
//        backButton.layer.borderWidth = 1.0
//        backButton.layer.borderColor = CGColor.init(srgbRed: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
//        backButton.clipsToBounds = true
//        backButton.setImage(UIImage(named: "backButton"), for: .normal)
//        backButton.backgroundColor = .white
////        backButton.titleLabel?.text = "<"
////        backButton.titleLabel?.textColor = .black
////        backButton.titleLabel?.font = UIFont(name: "Bold", size: 25)
//
//        backButton.addTarget(self, action: #selector(dimsmissView), for: .touchUpInside)
//
//        //autoLayout
//        backButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, trailing: nil, bottom: nil, padding: .init(top: 10, left: 10, bottom: 0, right: 0), size: .init(width: 30, height: 30))
//    }
//
//    @objc func dimsmissView() {
//        self.dismiss(animated: true, completion: nil)
//    }
//
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

//extension UIButton {
//    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, bottom : NSLayoutYAxisAnchor?, padding: UIEdgeInsets = .zero, size : CGSize = .zero) {
//        translatesAutoresizingMaskIntoConstraints = false
//
//        if let top = top {
//            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
//        }
//
//        if let leading = leading {
//            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
//        }
//
//        if let trailing = trailing {
//            trailingAnchor.constraint(equalTo: trailing, constant: padding.right).isActive = true
//        }
//
//        if let bottom = bottom {
//            bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom).isActive = true
//        }
//
//        if size.width != 0 {
//            widthAnchor.constraint(equalToConstant: size.width).isActive = true
//        }
//
//        if size.height != 0 {
//            heightAnchor.constraint(equalToConstant: size.height).isActive = true
//        }
//
//       }
//    }

