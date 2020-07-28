//
//  PPRoundRectButton.swift
//  PilotPlant
//
//  Created by LingoStar on 05/05/2019.
//  Copyright © 2019 LingoStar. All rights reserved.
//

import UIKit

@IBDesignable
open class PPRoundRectButton: UIButton {
    
    //이놈은 견적 작성시에 사용할 버튼 class
    //corner와 border는 각 VC에서 할당해라... 여기선 아직 모르겄다
    
//    @IBInspectable open var corner:Double = 1.0 {
//        didSet {
//            self.layoutIfNeeded()
//        }
//    }
//    @IBInspectable open var border:Double = 0.5 {
//        didSet {
//            self.layoutIfNeeded()
//        }
//    }
    
    override open func awakeFromNib() {
        self.addTarget(self, action: #selector(toggleButton), for:.touchUpInside)
    }
    
    @objc func toggleButton() {
        self.isSelected = !self.isSelected
    }
    
    override open var isSelected : Bool {
        didSet {
            if isSelected {
                self.backgroundColor = UIColor.white
                self.layer.borderWidth = 3.0
                self.layer.borderColor = CGColor(srgbRed: 0/255, green: 148/255, blue: 115/255, alpha: 1.0)
            } else {
                self.backgroundColor = UIColor.white
                self.layer.borderWidth = 1.0
                self.layer.borderColor = CGColor(srgbRed: 210/255, green: 210/255, blue: 210/255, alpha: 1.0)
            }
        }
    }
    
//    override open func layoutSubviews() {
//        super.layoutSubviews()
//        self.layer.cornerRadius = CGFloat(corner)
//        //self.layer.borderColor = self.tintColor.cgColor
//        self.layer.borderWidth = CGFloat(border)
//    }
    
    
}
