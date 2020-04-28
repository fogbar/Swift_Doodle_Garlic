//
//  TestTableViewCell.swift
//  tableViewCellXIBTest
//
//  Created by garlic on 2020/04/20.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var test1Label: UILabel!
    @IBOutlet weak var test2Label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
