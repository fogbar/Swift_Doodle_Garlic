//
//  BiddingTableViewController.swift
//  HanDdam
//
//  Created by garlic on 2020/04/25.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit

class BiddingTableViewController: UITableViewController {
    
    let bidDummyList = [bidderDummy1, bidderDummy2, bidderDummy3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: "BiddingTableViewCell", bundle: nil)
        self.tableView.register(nibName, forCellReuseIdentifier: "biddingCell")
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return bidDummyList.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "biddingCell", for: indexPath) as? BiddingTableViewCell else {return UITableViewCell()}

        guard let approachToPrice = bidDummyList[indexPath.section].biddingList else {return UITableViewCell()}
        
        cell.storeNameLabel.text = bidDummyList[indexPath.section].storeName
        cell.priceLabel.text = approachToPrice[0].price

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var height : CGFloat
        height = 30.0
        return height
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        var height : CGFloat
        height = 1.0
        return height
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailBiddingTVC = self.storyboard?.instantiateViewController(identifier: "DetailBiddingInfoTVC") else {return}
        
        //여기도 서버에서 데이터 가져오는 것 테스트 하면서 만들기
        //tableView로 만들지 아니면 스택뷰로 만들어야 될지 고민...
        detailBiddingTVC.navigationItem.title = "\(bidDummyList[indexPath.section].storeName) 견적상세정보"
        detailBiddingTVC.navigationItem.largeTitleDisplayMode = .never
        
        self.navigationController?.pushViewController(detailBiddingTVC, animated: true)
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
