//
//  TestTVC.swift
//  autoResizingCellInTableView
//
//  Created by garlic on 2020/06/09.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

struct ChatMessage {
    let text:String
    let isIncoming:Bool
    let date:Date
}

extension Date {
    static func dateFromCustomString(customString:String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        return dateFormatter.date(from: customString) ?? Date()
    }
}

class TestTVC: UITableViewController {
    
    let messagesFromServer = [
        ChatMessage(text: "Here's my very first message", isIncoming: true, date: Date.dateFromCustomString(customString: "2020/03/05")),
        ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: true, date: Date.dateFromCustomString(customString: "2020/03/05")),
        ChatMessage(text: "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap", isIncoming: false, date: Date.dateFromCustomString(customString: "2020/04/06")),
        ChatMessage(text: "Yo, dwag, whaddup!", isIncoming: false, date: Date.dateFromCustomString(customString: "2020/04/06")),
        ChatMessage(text: "This message should appear on the left with a white background", isIncoming: true, date: Date.dateFromCustomString(customString: "2020/04/06")),
        ChatMessage(text: "Third section message", isIncoming: true, date: Date.dateFromCustomString(customString: "2020/06/09"))
    ]
    
    fileprivate func attemptToAssembleGroupedMessages() {
        //print("Attempt to group out messages together based on Date property")
        
        let groupedMessages = Dictionary(grouping: messagesFromServer) { (element) -> Date in
            return element.date
        }
        
//        groupedMessages.forEach { (key, _) in
//            print(key)
//            let values = groupedMessages[key]
//            print(values ?? "")
//        }
        //☝️👇 위, 아래 둘 다 됨.
//        groupedMessages.forEach { (key, value) in
//            print(key)
//            print(value)
//        }
        
        let sortedKeys = groupedMessages.keys.sorted()
        sortedKeys.forEach { (key) in
            let values = groupedMessages[key]
            chatMessages.append(values ?? [])
        }
        
//        //👇 윗놈을 안쓰고 아랫놈을 쓰는 이유는 key를 가지고 value를 분류시켜야 하니깐.
//        groupedMessages.keys.forEach { (key) in
//            print(key)
//            let values = groupedMessages[key]
//            print(values ?? "")
//
//            chatMessages.append(values ?? [])
//        }
        
        //print(groupedMessages)
    }
    
    var chatMessages = [[ChatMessage]]()
    
    override func viewDidLoad() {
        
        attemptToAssembleGroupedMessages()
        
        super.viewDidLoad()

        self.tableView.register(ChatMessageCell.self, forCellReuseIdentifier: "id")
        
        self.tableView.separatorStyle = .none
        
        self.tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return chatMessages.count
    }
    
    class DateHeaderLabel : UILabel {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            backgroundColor = .black
            textColor = .white
            textAlignment = .center
            translatesAutoresizingMaskIntoConstraints = false //enables auto layout
            font = UIFont.boldSystemFont(ofSize: 14)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override var intrinsicContentSize: CGSize {
            let originalContentSize = super.intrinsicContentSize
            let height = originalContentSize.height + 12
            layer.cornerRadius = height / 2
            layer.masksToBounds = true
            return CGSize(width: originalContentSize.width + 16, height: height)
        }
    }
   
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let firstChatMessageInSection = chatMessages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy/MM/dd"
            let dateString = dateFormatter.string(from: firstChatMessageInSection.date)
            
            let label = DateHeaderLabel()
            label.text = dateString
            
            let containerView = UIView()
            
            containerView.addSubview(label)
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
                .isActive = true
            
            return containerView
        }
        return nil

    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages[section].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath) as? ChatMessageCell else {return UITableViewCell()}
        
//        cell.isIncoming = indexPath.row % 2 == 0
        
        let chatMessage = chatMessages[indexPath.section][indexPath.row]
        
        //cell.messageLabel.text = chatMessage.text // checks for odd/even
//        cell.isIncoming = chatMessage.isIncoming
        
        cell.chatMessage = chatMessage
        
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
