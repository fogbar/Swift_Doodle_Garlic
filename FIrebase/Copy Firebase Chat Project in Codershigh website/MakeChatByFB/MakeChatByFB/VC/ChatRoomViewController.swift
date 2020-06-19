
//
//  ChatRoomViewController.swift
//  MakeChatByFB
//
//  Created by garlic on 2020/05/12.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class ChatRoomViewController: UIViewController, UITextFieldDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var item: UINavigationItem!
    @IBOutlet weak var chatCollectionView: UICollectionView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var chatTextField: UITextField!
    
    var messages : [chatMessage] = [chatMessage(fromUserId: "", text: "", timeStamp: 0)]
    
    var groupKey: String? {
        didSet {
            if let key = groupKey {
                fetchMessages()
                FirebaseDataService.instance.groupRef.child(key).observeSingleEvent(of: .value) { (snapshot) in
                    if let data = snapshot.value as? Dictionary<String, AnyObject> {
                        if let title = data["name"] as? String {
                            self.item.title = title
                        }
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //number of items In Section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        messages.count
    }
    
    //cell For item at
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
