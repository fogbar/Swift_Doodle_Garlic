//
//  HomeViewTableViewController.swift
//  HanDdam
//
//  Created by 김동준 on 2020/04/14.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit

class HomeViewTableViewController: UITableViewController {
    //MARK:- IBOulets
    //견적 탭으로 이동하는 버튼
    @IBOutlet weak var requestButton: PPRoundRectButton!
    //맨 위에 보이는 유도 텍스트
    @IBOutlet weak var guidingLabel: UILabel!
    
    //MARK:- 변수 List
    //매거진 이름 배열
    let magazineNameList : [String] = ["LookBookRedThumbnail", "WeddingHanbokColorStoryThumbnail", "HanbokComposeThumbnail", "5minTermGuideThumbnail", "IntroduceHSOKThumbnail"]
    
    //MARK:- ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setRequestButton()
        guidingLabel.numberOfLines = 0
        guidingLabel.text =
        "지금 바로\n한복 견적을 비교해보세요!"
        guidingLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setRequestButton()
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //MARK:- IBActions
    @IBAction func changeTabTwo(_ sender: UIButton) {
        self.tabBarController?.selectedIndex = 1
    }
    
    //MARK:- Function List
    //requestButton 커스텀하는 함수
    func setRequestButton() {
        
        requestButton.layer.cornerRadius = 8.0
        requestButton.layer.borderWidth = 0.5
        requestButton.layer.borderColor = CGColor(srgbRed: 0/255, green: 148/255, blue: 115/255, alpha: 1.0)
        requestButton.tintColor = UIColor.init(cgColor: CGColor(srgbRed: 0/255, green: 148/255, blue: 115/255, alpha: 1.0))
        requestButton.setTitle("한복 견적 작성하러 가기", for: .normal)
        requestButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        requestButton.backgroundColor = UIColor.white
        
        //shadow -> swift.layer로 검색하면 나옴. 공부하세요!
        requestButton.layer.shadowColor = UIColor(red: 0/255, green: 148/255, blue: 115/255, alpha: 1.0).cgColor
        requestButton.layer.shadowRadius = 9
        requestButton.layer.shadowOpacity = 0.6
        requestButton.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return magazineNameList.count
    }
    //MARK: cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainButtonCell", for: indexPath)
        
        guard let imageView = cell.viewWithTag(101) as? UIImageView else {return cell}
        imageView.image = UIImage(named: magazineNameList[indexPath.row])
        
        return cell
    }
    //MARK: TableViewDidSelectRowAt
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "PdfVC") as? ShowPDFViewController else {return}
        if indexPath.row == 0 {
            if let targetURL = Bundle.main.url(forResource: "LookBookRed", withExtension: "pdf") {
                nextVC.targetURL = targetURL
            }
        } else if indexPath.row == 1 {
            if let targetURL = Bundle.main.url(forResource: "WeddingHanbokColorStory", withExtension: "pdf") {
                nextVC.targetURL = targetURL
            }
        }  else if indexPath.row == 2 {
            if let targetURL = Bundle.main.url(forResource: "HanbokCompose", withExtension: "pdf") {
                nextVC.targetURL = targetURL
            }
        }  else if indexPath.row == 3 {
            if let targetURL = Bundle.main.url(forResource: "5minTermGuide", withExtension: "pdf") {
                nextVC.targetURL = targetURL
            }
        }  else {
            if let targetURL = Bundle.main.url(forResource: "5minTermGuide", withExtension: "pdf") {
                nextVC.targetURL = targetURL
            }
        }
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}


// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "pushToPdfSegue" as String {
//            if let destination = segue.destination as? ShowPDFViewController, let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
//                if indexPath.row == 0 {
//                    guard let targetURL = Bundle.main.url(forResource: "LookBookRed", withExtension: "pdf")  else {return}
//                        destination.targetURL = targetURL
//                    } else if indexPath.row == 1 {
//                        guard let targetURL = Bundle.main.url(forResource: "WeddingHanbokColorStory", withExtension: "pdf")  else {return}
//                        destination.targetURL = targetURL
//                } else if indexPath.row == 2 {
//                    guard let targetURL = Bundle.main.url(forResource: "HanbokCompose", withExtension: "pdf")  else {return}
//                    destination.targetURL = targetURL
//                } else if indexPath.row == 3 {
//                    guard let targetURL = Bundle.main.url(forResource: "5minTermGuide", withExtension: "pdf")  else {return}
//                    destination.targetURL = targetURL
//                } else if indexPath.row == 4 {
//                    guard let targetURL = Bundle.main.url(forResource: "5minTermGuide", withExtension: "pdf")  else {return}
//                    destination.targetURL = targetURL
//                }
//            }
//        }
//    }



