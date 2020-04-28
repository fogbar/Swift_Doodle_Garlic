//
//  MyListTVC.swift
//  Pachinko
//
//  Created by 김동준 on 2020/04/03.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class MyListTVC: UITableViewController {
    
    //var dataOfMyList : [SelectedComponentInPickerView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load()
        
    }
    
    //    func load() {
    //        if let data = UserDefaults.standard.object(forKey: myListKey) as? Data {
    //            myList = try! PropertyListDecoder().decode([SelectedComponentInPickerView].self, from: data)
    //            dataOfMyList = myList
    //        }
    //    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        
        cell.imageView?.image = myList[indexPath.row].selectedimage
        cell.textLabel?.text = "\(myList[indexPath.row].selectedword1), \(myList[indexPath.row].selectedword2)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
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
        if segue.identifier == "DetailSegue" {
            if let destination = segue.destination as? DetailViewController, let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
                destination.detailImage = myList[indexPath.row].selectedimage
                destination.word1 = myList[indexPath.row].selectedword1
                destination.word2 = myList[indexPath.row].selectedword2
                destination.userSentence = myList[indexPath.row].userSentence
            }
        }
    }
    
    
}

