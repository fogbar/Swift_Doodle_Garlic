//
//  ControlCenter.swift
//  Pachinko
//
//  Created by 김동준 on 2020/04/02.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import Foundation
import UIKit

enum SliderState {
    case up, down
}

struct SelectedComponent {// : Codable
    // var selectedImage : Data? //image를 꼭 축소시켜서 Data 형식으로 저장시키지 않고 바로 UIImage로 저장시켜도 되지않나?
    var selectedimage : UIImage?
    var selectedword1 : String
    var selectedword2 : String
    var userSentence : String
    
    init() {
        self.selectedword1 = ""
        self.selectedword2 = ""
        self.userSentence = ""
    }
}

var selectedComponent = SelectedComponent()

var myList : [SelectedComponent] = []








//내일할꺼 1,2,3
//1. DetailVC에서 따로 변수가 필요할지 말지 생각해보기 --> Done 설명 : PrepareForSegue로 정보를 전달시에 전달을 받는 VC의 Outlet에 값을 직접 할 당할 수가 없으므로, 따로 값을 전달받을 property를 하나 만들어놓고, 그것을 값으로 할당해야한다.
//2. MyListTVC에서 destination으로 어떻게 정확한 selectedRow의 값을 넘길지 생각해보기 --> 이걸 하면 1번 자동으로 될듯 --> Done

//3. 1,2번 다 하고나면 UserDefault에 저장하는 법 알아보기
//4. pickerView 선택된 row의 내용 뽑는 법
