//
//  PopularBoardList.swift
//  UI_Zeplin
//
//  Created by 김동준 on 2021/01/11.
//

import SwiftUI

struct PopularBoardList: View {
    @ObservedObject var popularBoardViewModel = PopularBoardViewModel()
    
    var body: some View {
        VStack {
            ForEach(popularBoardViewModel.popularBoards, id: \.self) {
                PopularBoardView(popularBoard: $0)
            }
        }
        .onAppear {
            popularBoardViewModel.getPopularBoards()
        }
    }
}

struct PopularBoardList_Previews: PreviewProvider {
    static var previews: some View {
        PopularBoardList()
    }
}
