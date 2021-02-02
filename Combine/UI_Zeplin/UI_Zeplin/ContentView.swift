//
//  ContentView.swift
//  UI_Zeplin
//
//  Created by 김동준 on 2021/01/09.
//

import SwiftUI

struct ContentView: View {
    @State var tabIndex = false
    
    var body: some View {
//        NavigationView {
        
            TabView {
                ScrollView {
                    VStack {
                        MainHeader()
                            .padding(.top, 20)
                        Spacer().frame(height: 54)
                        SearchView()
                            .padding(.horizontal, 16)
                        
                        VStack {
                            BoardText()
                                .padding(.horizontal, 16)
                            BoardList()
                        }
                        
                        HStack {
                            PopularBoardText()
                                .padding(.horizontal, 16)
                            Spacer()
                        }
                        
                        PopularBoardList()
                        
                    }.padding(.bottom, 10)
                }
                .tabItem {
                    Image("iconHome")
                }
                
                Text("두 번째")
                    .tabItem {
                        Image("iconPopular")
                    }
                
                Text("세 번째")
                    .tabItem {
                        Image("iconBell")
                    }
            }
//            .navigationBarHidden(true)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
