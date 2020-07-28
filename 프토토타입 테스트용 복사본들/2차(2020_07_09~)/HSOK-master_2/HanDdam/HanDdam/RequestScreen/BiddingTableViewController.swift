//
//  BiddingTableViewController.swift
//  HanDdam
//
//  Created by garlic on 2020/04/25.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit

class BiddingTableViewController: UITableViewController {
    
    //VC 내부적으로 사용하는 변수
    let bidDummyList = [bidderDummy1, bidderDummy2, bidderDummy3]
    
    //MARK:- ViewLifeCycles
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

        let price = bidDummyList[indexPath.section].biddingList[indexPath.row].price
        
        cell.storeNameLabel.text = bidDummyList[indexPath.section].storeName
        cell.priceLabel.text = price

        return cell
    }
    
    //MARK:- table view delegate method
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
        guard let detailBiddingTVC = self.storyboard?.instantiateViewController(identifier: "DetailBiddingInfoVC") else {return}
        
        //여기도 서버에서 데이터 가져오는 것 테스트 하면서 만들기
        //tableView로 만들지 아니면 스택뷰로 만들어야 될지 고민...
        detailBiddingTVC.navigationItem.title = "\(bidDummyList[indexPath.section].storeName) 견적상세정보"
        detailBiddingTVC.navigationItem.largeTitleDisplayMode = .never
        
        self.navigationController?.pushViewController(detailBiddingTVC, animated: true)
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
