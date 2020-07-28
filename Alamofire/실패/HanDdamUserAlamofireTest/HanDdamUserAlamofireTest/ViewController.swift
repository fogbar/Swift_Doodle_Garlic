//
//  ViewController.swift
//  HanDdamUserAlamofireTest
//
//  Created by garlic on 2020/06/26.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    var root : Root = Root() {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        
        API.shared.getUserList(endPoint: "HanDdam/", completionHandler: { (userList) in
            self.root = userList
        })
        
    }

}

extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return root.userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCell(withIdentifier: "userCell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "userCell")
        }
        let user = root.userList[indexPath.row].field
        cell?.textLabel?.text = user.name
        cell?.detailTextLabel?.text = String(user.phoneNum!)
        
        return cell!
    }
    
    
}
