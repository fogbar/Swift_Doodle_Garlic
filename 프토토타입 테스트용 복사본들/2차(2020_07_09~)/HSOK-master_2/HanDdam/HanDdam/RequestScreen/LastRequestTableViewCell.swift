//
//  LastRequestTableViewCell.swift
//  HanDdam
//
//  Created by 김동준 on 2020/01/29.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit

class LastRequestTableViewCell: UITableViewCell {
    
    //MARK:- IBOutlets
    @IBOutlet weak var lastImage: UIImageView!
    @IBOutlet weak var lastDescription: UILabel!
    @IBOutlet weak var memoTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        memoTextView.text = "예) 신부 - 저고리 색깔을 더 연하게 하고 싶어요.\n시어머님 - 조끼를 추가하고 싶어요."
        memoTextView.layer.cornerRadius = 5.0
        memoTextView.backgroundColor = UIColor.init(cgColor: CGColor(srgbRed: 243/255, green: 243/255, blue: 243/255, alpha: 1.0))
        memoTextView.textColor = UIColor(cgColor: CGColor(srgbRed: 146/255, green: 146/255, blue: 146/255, alpha: 1.0))
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
