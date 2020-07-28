//
//  FabricCell.swift
//  HanDdam
//
//  Created by 김동준 on 2020/03/14.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit

class FabricCell: UITableViewCell {
    
    @IBOutlet weak var silkBtn: PPRoundRectButton!
    @IBOutlet weak var waterSilkBtn: PPRoundRectButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setButton(buttons: [silkBtn, waterSilkBtn])
        animation(of: [silkBtn, waterSilkBtn])
    }
    //버튼 세팅하는 함수
    func setButton(buttons : [UIButton]) {
        for button in buttons {
            button.layer.cornerRadius = 4.0
            button.layer.borderWidth = 1.0
            button.layer.borderColor = CGColor(srgbRed: 210/255, green: 210/255, blue: 210/255, alpha: 1.0)
        }
    }
    
    func animation(of buttons:[UIButton]) {
        for button in buttons {
            button.addTarget(self, action: #selector(animateButton(sender:)), for: .touchUpInside)
        }
    }
    
    @objc fileprivate func animateButton(sender:UIButton) {
        animateView(sender)
    }
    
    fileprivate func animateView(_ viewToAnimate:UIView) { //animate 좀 더 공부해보기
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 200, options: .curveEaseIn, animations: {
            
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            
        }) { (_) in
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 200, options: .curveEaseIn, animations: {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
