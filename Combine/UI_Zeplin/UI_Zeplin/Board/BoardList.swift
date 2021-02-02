//
//  BoardList.swift
//  UI_Zeplin
//
//  Created by 김동준 on 2021/01/09.
//

import SwiftUI

struct BoardList: View {
    @ObservedObject var boardViewModel = BoardViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack(spacing: 16) {
                ForEach(boardViewModel.boards, id: \.self) { board in
                    NavigationLink(
                        destination: MainHeader(),
                        label: {
                            BoardView(board: board)
                                .offset(x: 24)
                                
                        })
                }
            }.padding(.trailing, 48)
        })
        .frame(width: UIScreen.main.bounds.width, height: 231, alignment: .center)
        .onAppear {
            boardViewModel.getBoardDummy()
        }
        
    }
}

struct BoardList_Previews: PreviewProvider {
    static var previews: some View {
        BoardList()
    }
}
