//
//  ChatMessageCell.swift
//  autoResizingCellInTableView
//
//  Created by garlic on 2020/06/09.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {
    
    let messageLabel = UILabel()
    let bubbleBackgroundView = UIView()
    
    var leadingConstraint : NSLayoutConstraint!
    var trailingConstraint : NSLayoutConstraint!
    
    var chatMessage: ChatMessage! {
        didSet {
            bubbleBackgroundView.backgroundColor = chatMessage.isIncoming ? .white : .darkGray
            messageLabel.textColor = chatMessage.isIncoming ? .black : .white
            
            messageLabel.text = chatMessage.text
            
            if chatMessage.isIncoming {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
            } else {
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        bubbleBackgroundView.backgroundColor = .yellow
        bubbleBackgroundView.layer.cornerRadius = 12
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bubbleBackgroundView)
        
        addSubview(messageLabel)
        //messageLabel.backgroundColor = .green
        messageLabel.text = "we want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line"
        messageLabel.numberOfLines = 0
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        //lets set up some constraints for our label
        let constraints = [
            messageLabel.topAnchor.constraint(equalTo: self.topAnchor,
                                              constant: 16),
            messageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32),
            messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            
            bubbleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
            bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
            bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
            bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16)
        ]
        NSLayoutConstraint.activate(constraints)
        //☝️isActive가 false면 작동을 안하고 true면 작동을 하네.
        leadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32)
        leadingConstraint.isActive = false
        //☝️isActive가 false면 작동을 안하고 true면 작동을 하네.
        
        trailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        trailingConstraint.isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
