//
//  MyPageTableViewController.swift
//  HanDdam
//
//  Created by garlic on 2020/05/06.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit

class MyPageTableViewController: UITableViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var footerView: UIView!
    //사용하는 변수들
    let myPageList : [String] = ["견적 증빙서 한눈에 보기", "자주 묻는 질문", "공지사항"]
    
    //MARK:- ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibName = UINib(nibName: "MyPageTableViewCell", bundle: nil)
        self.tableView.register(nibName, forCellReuseIdentifier: "MyPageCell")
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font:UIFont(name: "HelveticaNeue-Bold", size: 30)!]
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
    
    //MARK:- table view delegate methods
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView : UIView?
        headerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: self.tableView.frame.width, height: 70.0))
        
        let welcomeUserLabel = UILabel(frame: CGRect(x: 18, y: 15, width: 300, height: 30))
        welcomeUserLabel.font = UIFont.boldSystemFont(ofSize: 20)
        welcomeUserLabel.textColor = UIColor.black
        welcomeUserLabel.text = "\(user.nickname)님 안녕하세요!"
        
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
        guard let certificationListVC = self.storyboard?.instantiateViewController(identifier: "certificationListVC") as? CertificatationListTableViewController else {return}
        
        if indexPath.row == 0 {
            certificationListVC.navigationItem.title = "견적 증빙서 한눈에 보기"
            certificationListVC.navigationItem.largeTitleDisplayMode = .never
            self.navigationController?.pushViewController(certificationListVC, animated: true)
        } else if indexPath.row == 1 {
            
        } else if indexPath.row == 2 {
            
        }
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
