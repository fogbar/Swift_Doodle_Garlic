//
//  CertificationCell.swift
//  HanDdam
//
//  Created by garlic on 2020/07/07.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit

class CertificationCell: UITableViewCell {

    @IBOutlet weak var issueCertificationBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //증빙서 버튼 커스텀
        issueCertificationBtn.layer.cornerRadius = 8.0
        issueCertificationBtn.layer.borderWidth = 0.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
