//
//  TestTableViewController.swift
//  StackView
//
//  Created by garlic on 2020/06/10.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class TestTableViewController: UITableViewController {

    let testCellId = "TestCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(TestCell.self, forCellReuseIdentifier: testCellId)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    
    class ShowImageView : UIImageView {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override var intrinsicContentSize: CGSize {
            if let myImage = self.image {
                let myImageWidth = myImage.size.width
                let myImageHeight = myImage.size.height
                let myViewWidth = self.frame.size.width
                
                let ratio = myViewWidth/myImageWidth
                let scaledHeight = myImageHeight * ratio
                
                return CGSize(width: myViewWidth, height: scaledHeight)
            }
            return CGSize(width: -1.0, height: -1.0)
        }
        
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: testCellId, for: indexPath) as! TestCell

        //여기서 분기를 해서 image 뿌리는 Cell을 찾아낸 다음에 거기서 stackView를 만들어서 돌리면 되겠네. 그럼 특정 cell에 접근하게 되니까 거기에서 label을 가져와서 여기에서 초기화 시킨다음에 추가시키는 식으로 가면 되겠다.
        for i in 1...indexPath.row + 1 {
            //여기서 Cell 내부의 imageView를 만들어 놓고 추가하면 되지 않을까? 짜피 stackView는 그냥 cell 내부에다가 넣어놓으면 되는 거니까.
            let imgView = ShowImageView()
            
        }

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
