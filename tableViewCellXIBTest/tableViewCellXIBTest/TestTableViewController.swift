//
//  TestTableViewController.swift
//  tableViewCellXIBTest
//
//  Created by garlic on 2020/04/20.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class TestTableViewController: UITableViewController {

    let arr1 = ["1", "2", "3", "4", "5"]
    let arr2 = ["1", "2", "3", "4", "5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibName = UINib(nibName: "TestTableViewCell", bundle: nil)
        self.tableView.register(nibName, forCellReuseIdentifier: "testCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr1.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath) as? TestTableViewCell else {return UITableViewCell()}

        cell.test1Label.text = arr1[indexPath.row]
        cell.test2Label.text = arr2[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var height : CGFloat
        height = 60.0
        return height
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView : UIView?
        headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: 60))
        
        let testLabel : UILabel = UILabel(frame: CGRect(x: 30, y: 10, width: self.tableView.frame.size.width, height: 30))
        testLabel.text = "아니 왜 안되는거야ㅑㅏㅏㅏㅏ"
        
        headerView?.addSubview(testLabel)
        return headerView
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
