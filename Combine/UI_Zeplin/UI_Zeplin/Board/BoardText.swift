//
//  BoardText.swift
//  UI_Zeplin
//
//  Created by 김동준 on 2021/01/09.
//

import SwiftUI

struct BoardText: View {
    var body: some View {
        HStack(alignment: .bottom) {
            Text("김동준님의 보드")
                .fontWeight(.black)
                .font(Font.custom("AppleSDGothicNeo-Bold", size: 28))
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Text("더보기")
                    .foregroundColor(.orange)
                    .font(Font.custom("AppleSDGothicNeo-SemiBold", size: 16))
                    .padding(.bottom, 5)
            })
        }
        .frame(width: UIScreen.main.bounds.width - 24)
        
    }
}

struct BoardText_Previews: PreviewProvider {
    static var previews: some View {
        BoardText()
    }
}
