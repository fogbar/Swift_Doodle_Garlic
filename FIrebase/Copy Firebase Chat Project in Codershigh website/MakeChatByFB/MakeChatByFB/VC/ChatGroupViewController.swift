//
//  ChatGroupViewController.swift
//  MakeChatByFB
//
//  Created by garlic on 2020/05/11.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class ChatGroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView:UITableView!
    
    var groups : [Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        fetchChatGroupList()
    }
    
    func fetchChatGroupList() {
        if let uid = FirebaseDataService.instance.currentUserUid {
            FirebaseDataService.instance.userRef.child(uid).child("groups").observeSingleEvent(of: .value) { (snapshot) in
                //사용자가 어떠한 채팅방을 가지고 있는지 확인하여 채팅방에 대한 레퍼런스를 가져온다.라는 것이라면 snapshot은 현재 userRef.child("groups")에 있는 모든 데이터들을 snapshot이라는 매개변수에 전달시키는 거구나. 그럼 snapshot은 현재 레퍼런스에 있는 값들을 캡쳐한다고 생각하면 되는 구나. 그래서 eventType 파라미터를 .value로 준건가? value값들을 캡쳐하라고?
                if let dict = snapshot.value as? Dictionary<String,Int> {
                    //Model을 통해 유추해보자면 여기서 Dictionary가 의미하는 것은 그룹의 메시지 내용들인 것 같다. 아니야.. 지금 key가 무엇인지 유추할 수 있다면... 감 잡힌 바로는 Group에 있는 Init(key:, data:) 이니셜라이저에서 보면 key를 통해서 group에 현재 접속해 있는 유저가 포함되어 있는 그룹인지 아닌지 알아낼 수 있고, 그 후 data를 통해서 name에 접근하고, AnyObject로 message관련한게 들어가는거 아닐까 싶음... 근데 그러면 여기 dict에서는 왜 Dictionary<String,Int>로 캐스팅 한거지? Int가 무슨 이유에서 필요한거지?
                    for (key, _) in dict {
                        // 각 채팅방에 대한 레퍼런스를 가져오면 해당 레퍼런스를 이용하여 채팅방에 대한 정보를 가져온다.
                        
                        FirebaseDataService.instance.groupRef.child(key).observeSingleEvent(of: .value) { (snapshot) in
                            if let data = snapshot.value as? Dictionary<String,AnyObject> {
                                let group = Group(key: key, data: data)
                                self.groups.append(group)
                                
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "chatting", sender: groups[indexPath.row].key)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath)
        cell.textLabel?.text = groups[indexPath.row].name
        return cell
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "userList", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "userList" {
            //굳이 userListVC에서 sender를 한번 더 확인하는 이유는??? -> 교수님께 질문!
            //내 추축 : 채팅방으로 넘어가기 위함! 근데 unwindToSegue로 대체가 될 것 같은 이 기분은 뭐지??
            let userListVC = segue.destination as! UserListViewController
            let chatGroupVC = sender as! ChatGroupViewController
            userListVC.chatGroupVC = chatGroupVC
        } else if segue.identifier == "chatting" {
            let chatVC = segue.destination as! ViewController
            chatVC.groupKey = sender as? String
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
