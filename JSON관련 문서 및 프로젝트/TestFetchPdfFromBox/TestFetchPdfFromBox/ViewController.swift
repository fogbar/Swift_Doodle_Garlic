//
//  ViewController.swift
//  TestFetchPdfFromBox
//
//  Created by garlic on 2020/05/23.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let pdfUrlList : [String] = ["https://app.box.com/s/tx8m6gzuek8etzlk2cygqgqc1lj7z6ad", "https://app.box.com/s/x7puuy2xlzcllftwcwjhodwiuyldbyxo", "https://app.box.com/s/e8zphhqirj6zdzuy6hdwk73oph67fzef", "https://app.box.com/s/eknh608h1uw1jypbrpki2vd9a3lbfdrw", "https://app.box.com/s/h423d3f3nq4ht9yoccq1afte4cx0gtj1"]
    
    var targetUrl : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func fetchPdfFromServer(index:Int) {
        let urlString : String = pdfUrlList[index]
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            do {
                self.targetUrl = data[index]
                //box url은 json이 아니라 그냥 url이라 decoding하는게 아님. 그럼? url만 가져와서 뿌리면 될 경우에는 어떻게 하면 되지? 흐음...
                //그냥 url를 받아와서 바로 webView로 뿌려주면 되는데 이걸 어떻게 해야하지..
            }
        }
    }

}

