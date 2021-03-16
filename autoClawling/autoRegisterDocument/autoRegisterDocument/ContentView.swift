//
//  ContentView.swift
//  autoRegisterDocument
//
//  Created by 김동준 on 2021/02/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .onAppear {
                get()
            }
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
