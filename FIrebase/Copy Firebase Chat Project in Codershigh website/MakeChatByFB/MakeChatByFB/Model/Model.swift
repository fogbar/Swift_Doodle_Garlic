//
//  Model.swift
//  MakeChatByFB
//
//  Created by garlic on 2020/05/11.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import Foundation

//말풍선 하나
struct chatMessage {
    var fromUserId : String
    var text : String
    var timeStamp : NSNumber
}

//채팅방
struct Group {
    var key : String
    var name : String
    var messages : Dictionary<String,Int>
    
    init(key:String, name:String) {
        self.key = key
        self.name = name
        self.messages = [:]
    }
    
    init(key:String, data:Dictionary<String,AnyObject>) {
        self.key = key
        self.name = data["name"] as! String
        if let messages = data["messages"] as? Dictionary<String,Int> {
            self.messages = messages
        } else {
            self.messages = [:]
        }
    }
}
//사용자
struct User {
    var uid: String
    var email:String
    var username:String
    var group : Dictionary<String,String>
    
    init(uid:String, email:String, username:String) {
        self.uid = uid
        self.email = email
        self.username = username
        self.group = [:]
    }
}
