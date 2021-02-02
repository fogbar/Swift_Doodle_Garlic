//
//  MainHeader.swift
//  UI_Zeplin
//
//  Created by 김동준 on 2021/01/09.
//

import SwiftUI

struct MainHeader: View {
    var body: some View {
        HStack {
            //iconMenu
            Button(action: {
                
            }, label: {
                Image("iconMenu")
            })
            
            Spacer()
            
            //userProfile
            ZStack {
                Image("userProfile")
                
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.clear)
            }
        }.frame(width: UIScreen.main.bounds.width - 24, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct MainHeader_Previews: PreviewProvider {
    static var previews: some View {
        MainHeader()
    }
}
