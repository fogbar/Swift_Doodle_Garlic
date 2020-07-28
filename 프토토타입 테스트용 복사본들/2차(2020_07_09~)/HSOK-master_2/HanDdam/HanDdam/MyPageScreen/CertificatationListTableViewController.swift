//
//  CertificatationListTableViewController.swift
//  HanDdam
//
//  Created by garlic on 2020/07/07.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit

class CertificatationListTableViewController: UITableViewController {
    
    //내부적으로 사용되는 변수들
    let storeName = "운현주단"
    let price = "50만원"
    
    //MARK:- ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let certificationListNib = UINib(nibName: "CertificationListCell", bundle: nil)
        self.tableView.register(certificationListNib, forCellReuseIdentifier: "certificationListCell")
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let certificationListCell = self.tableView.dequeueReusableCell(withIdentifier: "certificationListCell") as? CertificationListCell else {return UITableViewCell()}
        
        certificationListCell.storeNameLabel.text = self.storeName
        certificationListCell.priceLabel.text = self.price
        
        return certificationListCell
    }
    
    //MARK:- table view delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let showCertificationVC = self.storyboard?.instantiateViewController(identifier: "showCertificationVC") else {return}
        
        showCertificationVC.navigationItem.title = "견적 증빙서"
        showCertificationVC.navigationItem.largeTitleDisplayMode = .never
        
        self.navigationController?.pushViewController(showCertificationVC, animated: true)
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
