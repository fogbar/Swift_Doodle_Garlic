//
//  ImageCell.swift
//  HanDdam
//
//  Created by 김동준 on 2020/03/14.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit


class ImageCell: UITableViewCell {
    
    @IBOutlet weak var hanbokImage: UIImageView!
    @IBOutlet weak var imageBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        hanbokImage.image = UIImage(named: "detailRequestDefaultImage")
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
