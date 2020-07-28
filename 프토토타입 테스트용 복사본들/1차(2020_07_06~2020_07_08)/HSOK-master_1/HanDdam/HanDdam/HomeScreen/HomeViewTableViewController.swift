//
//  HomeViewTableViewController.swift
//  HanDdam
//
//  Created by 김동준 on 2020/04/14.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit

class HomeViewTableViewController: UITableViewController {
    
    @IBOutlet weak var requestButton: PPRoundRectButton!
    
    let magazineNameList : [String] = ["LookBookRedThumbnail", "WeddingHanbokColorStoryThumbnail", "HanbokComposeThumbnail", "5minTermGuideThumbnail", "IntroduceHSOKThumbnail"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setRequestButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setRequestButton()
    }
    
    
    func setRequestButton() {
        
        requestButton.layer.cornerRadius = 8.0
        requestButton.layer.borderWidth = 0.5
        requestButton.layer.borderColor = CGColor(srgbRed: 0/255, green: 148/255, blue: 115/255, alpha: 1.0)
        requestButton.tintColor = UIColor.init(cgColor: CGColor(srgbRed: 0/255, green: 148/255, blue: 115/255, alpha: 1.0))
        requestButton.setTitleColor(UIColor.init(cgColor: CGColor(srgbRed: 94/255, green: 94/255, blue: 115/255, alpha: 1.0)), for: .normal)
        requestButton.setTitle("지금 바로 한복 견적을 작성해보세요 !", for: .normal)
        requestButton.backgroundColor = UIColor.white
        
        //shadow -> swift.layer로 검색하면 나옴. 공부하세요!
        requestButton.layer.shadowColor = UIColor(red: 0/255, green: 148/255, blue: 115/255, alpha: 1.0).cgColor
        requestButton.layer.shadowRadius = 9
        requestButton.layer.shadowOpacity = 0.4
        requestButton.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    @IBAction func changeTabTwo(_ sender: UIButton) {
        self.tabBarController?.selectedIndex = 1
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
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainButtonCell", for: indexPath)
        
        guard let imageView = cell.viewWithTag(101) as? UIImageView else {return cell}
        imageView.image = UIImage(named: magazineNameList[indexPath.row])
        
        return cell
    }
    
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



/*
 // Override to support conditional editing of the table view.
 override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the specified item to be editable.
 return true
 }
 */

/*
 // Override to support editing the table view.
 override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
 if editingStyle == .delete {
 // Delete the row from the data source
 tableView.deleteRows(at: [indexPath], with: .fade)
 } else if editingStyle == .insert {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
 
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the item to be re-orderable.
 return true
 }
 */


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



