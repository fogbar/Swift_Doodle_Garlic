//
//  CertificatationListTableViewController.swift
//  HanDdam
//
//  Created by garlic on 2020/07/07.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit

class CertificatationListTableViewController: UITableViewController {
    
    let storeName = "운현주단"
    let price = "50만원"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let certificationListNib = UINib(nibName: "CertificationListCell", bundle: nil)
        self.tableView.register(certificationListNib, forCellReuseIdentifier: "certificationListCell")
    }
    
    //    @objc func showCertification() {
    //
    //    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let certificationListCell = self.tableView.dequeueReusableCell(withIdentifier: "certificationListCell") as? CertificationListCell else {return UITableViewCell()}
        
        certificationListCell.storeNameLabel.text = self.storeName
        certificationListCell.priceLabel.text = self.price
        
        //        certificationListCell.certificationBtn.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        
        return certificationListCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let showCertificationVC = self.storyboard?.instantiateViewController(identifier: "showCertificationVC") else {return}
        
        showCertificationVC.navigationItem.title = "견적 증빙서"
        showCertificationVC.navigationItem.largeTitleDisplayMode = .never
        
        self.navigationController?.pushViewController(showCertificationVC, animated: true)
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
