//
//  AgeCell.swift
//  HanDdam
//
//  Created by 김동준 on 2020/03/14.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit

class AgeCell: UITableViewCell {

    @IBOutlet weak var ageSlider: UISlider!
    
    var ageValue : String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setSlider()
        
    }

    func setSlider() {
        ageSlider.isContinuous = true
        ageSlider.maximumValue = 8.0
        ageSlider.minimumValue = 0.0
        ageSlider.value = 0.0
        ageSlider.thumbTintColor = UIColor(cgColor: CGColor(srgbRed: 0/255, green: 169/255, blue: 156/255, alpha: 1.0))
        ageSlider.maximumTrackTintColor = UIColor.black
        ageSlider.minimumTrackTintColor = UIColor.black
        ageSlider.addTarget(self, action: #selector(changeValue(slider:)), for: .valueChanged)
        
    }
    
    @objc func changeValue(slider: UISlider) {
        
        ageSlider.value = roundf(ageSlider.value)
        
        //let currentValue = roundf(ageSlider.value)
        
        switch ageSlider.value {
        case 0:
            let age = Age.teen
            ageValue = age.rawValue
        case 1:
            let age = Age.twenty
            ageValue = age.rawValue
        case 2 :
            let age = Age.thirty
            ageValue = age.rawValue
        case 3:
            let age = Age.fourty
            ageValue = age.rawValue
        case 4:
            let age = Age.fifty
            ageValue = age.rawValue
        case 5:
            let age = Age.sixty
            ageValue = age.rawValue
        case 6:
            let age = Age.seventy
            ageValue = age.rawValue
        case 7:
            let age = Age.eighty
            ageValue = age.rawValue
        case 8:
            let age = Age.ninety
            ageValue = age.rawValue
        default:
            ageValue = Age.teen.rawValue
        }
        
        detailRequest.age = ageValue
        print(detailRequest.age)
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
