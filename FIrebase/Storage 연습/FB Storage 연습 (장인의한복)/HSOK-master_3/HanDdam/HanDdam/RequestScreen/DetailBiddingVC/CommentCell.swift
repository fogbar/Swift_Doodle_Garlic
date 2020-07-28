//
//  CommentCell.swift
//  HanDdam
//
//  Created by garlic on 2020/07/07.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    //어쨰서 stackView를 넣어야만 DummyData의 글자 수에 따라서 cell의 크기가 달라지는 것일까?
    //왜 commentLabel만 있으면 DummyData에 있는 String이 들어가지지 않는 것일까?
    @IBOutlet weak var imageListStackView: UIStackView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
