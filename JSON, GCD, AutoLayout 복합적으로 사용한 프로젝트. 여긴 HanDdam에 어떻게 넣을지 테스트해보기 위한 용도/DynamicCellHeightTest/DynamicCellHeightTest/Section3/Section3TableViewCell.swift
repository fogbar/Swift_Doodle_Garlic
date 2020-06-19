//
//  Section3TableViewCell.swift
//  DynamicCellHeightTest
//
//  Created by garlic on 2020/05/16.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class Section3TableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var imageListStackView: UIStackView!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }
    
    
    //우선 image들을 box에 올리고 거기의 url들을 json 파일로 만들어서 그냥 imageList하나 만들자. 그다음에 거기서 가져오는 방식으로 해보자.
    
    //여기서 DispatchQueue 비동기처리를 통해서 image를 받아오도록 하고, 그 받아온 이미지를 여기서 stackView를 하나 만들어 놓고 거기서 imageView를 생성하게 한 다음에 image에 따라 ImageView에 생성되도록 하자.
    //그럼 여기 ImageView말고 stackView를 넣어놓고 함수에 imageView를 refectoring을 하도록 하면 될듯.
    
    //그럼 image의 url링크를 가져오는 것은 DispatchQueue.main.async 혹은 global().async로 구현 --> 근데 교수님이 image Queue를 하나 만들라고 했으니 거기서. 처리하면 되겠다. 그러고 그것을 stackView 내부에 넣는 것은 main.asycn에서 실행
    

    
    
    
}
