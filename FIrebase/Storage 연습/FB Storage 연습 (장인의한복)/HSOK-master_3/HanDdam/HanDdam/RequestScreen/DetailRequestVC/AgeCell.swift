//
//  AgeCell.swift
//  HanDdam
//
//  Created by 김동준 on 2020/03/14.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit

class AgeCell: UITableViewCell {

    //DetailRequestVC에서 나이를 표시하는 Slider로 사용됨.
    //그러나 이제 PickerView로 선택하도록 바뀔 것
    @IBOutlet weak var ageSlider: UISlider!
    
    //나이를 표시해주는 변수
    var ageValue : String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setSlider()
        
    }
    
    //Slider 세팅하는 함수
    func setSlider() {
        ageSlider.isContinuous = true
        ageSlider.maximumValue = 8.0
        ageSlider.minimumValue = 0.0
        ageSlider.value = 0.0
        ageSlider.thumbTintColor = UIColor(cgColor: CGColor(srgbRed: 0/255, green: 169/255, blue: 156/255, alpha: 1.0))
        ageSlider.maximumTrackTintColor = UIColor.black
        ageSlider.minimumTrackTintColor = UIColor.black
        ageSlider.value = roundf(ageSlider.value)
        
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
