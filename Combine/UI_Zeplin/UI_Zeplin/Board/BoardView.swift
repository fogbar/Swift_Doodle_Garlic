//
//  BoardView.swift
//  UI_Zeplin
//
//  Created by 김동준 on 2021/01/09.
//

import SwiftUI

struct BoardView: View {
    
    private let board : Board
    
    init(board: Board) {
        self.board = board
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            Image("\(self.board.background)")
            
            Image("\(self.board.image)")
            
            VStack {
                VStack(spacing: 8) {
                    Text("\(self.board.typeName)")
                        .foregroundColor(.white)
                        .font(Font.custom("AppleSDGothicNeo-Bold", size: 17))
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.white.opacity(0.2))
                            .frame(width: 50, height: 22, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(10)
                        Text("\(self.board.num)")
                            .foregroundColor(.white)
                            .font(Font.custom("SFProText-Regular", size: 12))
                        
                    }
                }
                .padding(.leading, 16)
                .padding(.top, 16)
                
                Spacer()
            }.frame(height: 231)
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(board: Board(typeName: "포스터", num: 465, image: "image45", background: "4963"))
    }
}
