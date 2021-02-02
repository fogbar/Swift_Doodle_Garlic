//
//  PopularBoardView.swift
//  UI_Zeplin
//
//  Created by 김동준 on 2021/01/11.
//

import SwiftUI

struct PopularBoardView: View {
    
    private let popularBoard : PopularBoard
    
    init(popularBoard: PopularBoard) {
        self.popularBoard = popularBoard
    }
    
    var body: some View {
        HStack {
            Image("\(popularBoard.image)")
                .resizable()
//                .aspectRatio(contentMode: .fill)
                .frame(width: 98, height: 65)
            
            Spacer()
                .frame(width: 16)
            
            VStack(alignment: .leading) {
                Text("\(popularBoard.title)")
                    .font(Font.custom("AppleSDGothicNeo-Bold", size: 17))
                
                Text("\(popularBoard.subTitle)")
                    .font(Font.custom("SFProText-Regular", size: 12))
                    .foregroundColor(Color.black.opacity(0.3))
            }
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Text("팔로우")
                    .foregroundColor(.white)
                    .font(Font.custom("AppleSDGothicNeo-SemiBold", size: 12))
                    .padding(.vertical, 4)
                    .padding(.horizontal, 10)
                    .background(
                        Rectangle()
                            .cornerRadius(20.0)
                            .foregroundColor(Color.black.opacity(0.6))
                    )
            })
        }
        .frame(width: UIScreen.main.bounds.width - 48, height: 65)
    }
}

struct PopularBoardView_Previews: PreviewProvider {
    static var previews: some View {
        PopularBoardView(popularBoard: PopularBoard(image: "image32", title: "패키지 디자인", subTitle: "팔로워 294K"))
    }
}
