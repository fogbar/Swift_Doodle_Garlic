//
//  Section2TableViewCell.swift
//  DynamicCellHeightTest
//
//  Created by garlic on 2020/05/16.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class Section2TableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
