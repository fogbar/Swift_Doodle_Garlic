//
//  RequestListTableViewCell.swift
//  HanDdam
//
//  Created by garlic on 2020/04/20.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit

class RequestListTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    //이놈들 xib파일에서 오토레이아웃 맞출때 detailLabel의 width가 기종에 따라서 자유롭게 조절되도록 하고 싶은데 어떻게 하는거냐 대체... width랑 height를 personLabelrhk detailLabel 모두 고정시키지 않는 이상 스택뷰로 묶으면 모두 같은 크기로 고정되버림.. width와 height를 고정시키지 않고 그냥 하나의 label의 width나 height만 변경할 수 있는 방법은 없나?
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    
    }
    
}
