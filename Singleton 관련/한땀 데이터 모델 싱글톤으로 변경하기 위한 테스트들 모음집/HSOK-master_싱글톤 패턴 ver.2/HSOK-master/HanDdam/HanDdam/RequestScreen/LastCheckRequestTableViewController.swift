//
//  LastCheckRequestTableViewController.swift
//  HanDdam
//
//  Created by 김동준 on 2020/01/29.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit

class LastCheckRequestTableViewController: UITableViewController {
    
    //let cell = UITableViewCell() as? LastRequestTableViewCell
    //여기서 이렇게 접근하는 거랑 cell의 awakeFromNib에서 접근하는 거랑 뭔 차이지?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

//    override func viewDidDisappear(_ animated: Bool) {
//        let presentingVC = self.presentingViewController as? RequestTableViewController
//        presentingVC?.tableView.reloadData()
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        guard let presentingVC = self.presentingViewController as? RequestTableViewController else {return}
//        presentingVC.tableView.reloadData()
//    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowCount = request.person.count
        return rowCount
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "checkRequestCell", for: indexPath) as? LastRequestTableViewCell else { return UITableViewCell() }
        
        let detailDescription = request.detailRequestPerPerson[indexPath.row]
        let personDescription = request.person[indexPath.row]
        let textViewText = cell.memoTextView.text! //--> ! 어떻게 없앨지 생각해보기
        
        cell.lastDescription?.text = "\(detailDescription.makingType)/\(personDescription)/\(detailDescription.age)/\(detailDescription.season)/\(detailDescription.fabric)"
        cell.lastImage?.image = detailDescription.detailImage
        //cell.memoTextView.text
        request.defaultMemo(textViewText: textViewText) //여기서 request에 memo가 저장되는건가? 각 textField마다 어떻게 저장시킬지 알아보기
        //guard let textViewText = cell?.memoTextView.text else { return }
        //request.defaultMemo(textViewText: textViewText)
        
        return cell
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backToRequestTVCSegue" {
            if let destination = segue.destination as? RequestTableViewController {
                user.myRequests.append(request)
                print(user)
                destination.tableView.reloadData()
            }
        }
    }
    
    
}
