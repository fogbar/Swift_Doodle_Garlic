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
    //MARK:- IBOutlets
    // 매거진 보여주는 webView
    @IBOutlet weak var webView: WKWebView!
    
    //MARK:- 변수 List
    var targetURL : URL?
    
    //MARK:- ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let targetURL = targetURL else {return}
        let request = URLRequest(url: targetURL)
        webView.load(request)
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
