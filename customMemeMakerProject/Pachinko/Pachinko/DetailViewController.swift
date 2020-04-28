//
//  DetailViewController.swift
//  Pachinko
//
//  Created by 김동준 on 2020/04/07.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailWord1Label: UILabel!
    @IBOutlet weak var detailWord2Label: UILabel!
    @IBOutlet weak var userSetenceLabel: UILabel!
    
    //그냥 앞에서 prepareForSegue를 통해서 값들 다 넘겨주면 되는 거 아닌가? -> 잘 생각해보기
    var detailImage : UIImage?
    var word1 : String?
    var word2 : String?
    var userSentence : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
             
        detailImageView.image = detailImage
        detailWord1Label.text = word1
        detailWord2Label.text = word2
        userSetenceLabel.text = userSentence
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
