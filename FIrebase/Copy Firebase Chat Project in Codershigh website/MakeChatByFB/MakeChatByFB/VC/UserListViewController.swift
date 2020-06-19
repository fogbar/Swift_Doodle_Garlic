//
//  UserListViewController.swift
//  MakeChatByFB
//
//  Created by garlic on 2020/05/11.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView:UITableView!
    
    var chatGroupVC : ChatGroupViewController?
    var userList : [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        fetchUserList()
    }
    
    func fetchUserList() {
        FirebaseDataService.instance.userRef.observeSingleEvent(of: .value) { (snapshot) in
            if let data = snapshot.value as? Dictionary<String,AnyObject>, let uid = FirebaseDataService.instance.currentUserUid {
                for (key, data) in data {
                    if uid != key { //이거 확인은 무슨 의미지?
                        if let userData = data as? Dictionary<String,AnyObject> {
                            let username = userData["name"] as! String
                            let email = userData["email"] as! String
                            let user = User(uid: uid, email: email, username: username)
                            
                            self.userList.append(user)
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // ref는 groupRef 하위에 새로 group을 생성하기 위함.
        let ref = FirebaseDataService.instance.groupRef.childByAutoId()
        ref.child("name").setValue(userList[indexPath.row].username as String)
        dismiss(animated: true) {
            //흠.. chatGroupVC를 확인하는 이유가 있었고만... 내 추축! : performSegue를 실행하기 위햇. 근데 이건 그냥 unwindToSegue로 전달하고나서 거기서 completion에 코드를 작성해도 되지 않..나?
            if let chatGroupListVC = self.chatGroupVC {
                self.chatGroupVC?.performSegue(withIdentifier: "chatting", sender: ref.key)
            }
        }
        return
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        cell.textLabel?.text = userList[indexPath.row].username
        cell.detailTextLabel?.text = userList[indexPath.row].email
        return cell
    }
    
    @IBAction func cancelButtonTapped(_ sender:UIButton) {
        dismiss(animated: true, completion: nil)
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
