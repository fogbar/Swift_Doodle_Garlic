//
//  FirstCell.swift
//  CopyBoxOffice
//
//  Created by garlic on 2020/05/07.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class FirstCell: UITableViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var userRatingLabel: UILabel!
    @IBOutlet weak var reservationGraderLabel: UILabel!
    @IBOutlet weak var reservationRateLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
