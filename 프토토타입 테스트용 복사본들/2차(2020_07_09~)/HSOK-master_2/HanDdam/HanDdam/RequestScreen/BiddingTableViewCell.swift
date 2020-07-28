//
//  BiddingTableViewCell.swift
//  HanDdam
//
//  Created by garlic on 2020/04/27.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit

class BiddingTableViewCell: UITableViewCell {

    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
