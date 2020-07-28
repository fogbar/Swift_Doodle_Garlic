//
//  ViewController.swift
//  getUserListTest
//
//  Created by garlic on 2020/06/26.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    
    
    var userList : UserList? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblView.dataSource = self
        
//        API.shared.getData(by: urlString) { (userList) in
//            self.userList = userList
//            DispatchQueue.main.async {
//                self.tblView.reloadData()
//            }
//        }
        
        API.shared.getData2 { (userList) in
            self.userList = userList
            DispatchQueue.main.async {
                self.tblView.reloadData()
            }
        }
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rowCount = self.userList?.data.count else { return 0 }
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        
        let userInfo = userList?.data[indexPath.row].field
        guard let phoneNumber = userInfo?.phoneNum else {return UITableViewCell()}
        
        cell.textLabel?.text = userInfo?.name
        cell.detailTextLabel?.text = String(phoneNumber)
        return cell
    }
    
    
}
