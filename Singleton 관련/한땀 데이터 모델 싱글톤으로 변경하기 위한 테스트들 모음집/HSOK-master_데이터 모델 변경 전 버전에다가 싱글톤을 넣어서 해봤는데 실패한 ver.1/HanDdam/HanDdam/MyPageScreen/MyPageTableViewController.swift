//
//  MyPageTableViewController.swift
//  HanDdam
//
//  Created by garlic on 2020/05/06.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit

class MyPageTableViewController: UITableViewController {
    
    let myPageList : [String] = ["견적 증빙서 한눈에 보기", "자주 묻는 질문", "공지사항"]
    
    @IBOutlet weak var footerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibName = UINib(nibName: "MyPageTableViewCell", bundle: nil)
        self.tableView.register(nibName, forCellReuseIdentifier: "MyPageCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let rowCount = myPageList.count
        return rowCount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageCell", for: indexPath)

        cell.textLabel?.text = myPageList[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView : UIView?
        headerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: self.tableView.frame.width, height: 70.0))
        
        let welcomeUserLabel = UILabel(frame: CGRect(x: 18, y: 15, width: 150, height: 30))
        welcomeUserLabel.font = UIFont.boldSystemFont(ofSize: 20)
        welcomeUserLabel.textColor = UIColor.black
        welcomeUserLabel.text = "\(User.getInstance.name)님 안녕하세요!"
        
        headerView?.addSubview(welcomeUserLabel)
        
        return headerView
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var height : CGFloat
        height = 70.0
        return height
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height : CGFloat
        height = 70.0
        return height
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let documentVC = self.storyboard?.instantiateViewController(identifier: "doocumentVC") as? DocumentViewController else {return}
        
        if indexPath.row == 0 {
            self.navigationController?.pushViewController(documentVC, animated: true)
        } else if indexPath.row == 1 {
            
        } else if indexPath.row == 2 {
            
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
