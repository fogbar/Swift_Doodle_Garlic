//
//  PopularBoardText.swift
//  UI_Zeplin
//
//  Created by 김동준 on 2021/01/11.
//

import SwiftUI

struct PopularBoardText: View {
    var body: some View {
        Text("인기있는 보드")
            .fontWeight(.black)
            .font(Font.custom("AppleSDGothicNeo-Bold", size: 28))
    }
}

struct PopularBoardText_Previews: PreviewProvider {
    static var previews: some View {
        PopularBoardText()
    }
}
