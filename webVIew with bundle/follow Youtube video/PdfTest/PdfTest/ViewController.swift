//
//  ViewController.swift
//  PdfTest
//
//  Created by 김동준 on 2020/03/10.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    var targetURL : URL?
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setting()
    }
    
    func setting() {
        backButton.backgroundColor = .white
        backButton.layer.cornerRadius = 5
        backButton.layer.borderWidth = 0.1
        backButton.layer.borderColor = CGColor.init(srgbRed: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        
        webView.addSubview(backButton)
        webView.backgroundColor = .white
        //let webView = WKWebView(frame: view.frame)
        guard let targetUrl = targetURL else { return }
        let request = URLRequest(url: targetUrl)
        webView.load(request)
        view.addSubview(webView)
        
        self.view.layoutIfNeeded()
    }
    
    /*
    @IBAction func unwindSegueToVC(segue:UIStoryboardSegue) {
        
    }
    */
        
    @IBAction func dismissModal(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    }
    


