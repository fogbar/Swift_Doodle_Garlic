//
//  SearchView.swift
//  UI_Zeplin
//
//  Created by 김동준 on 2021/01/09.
//

import SwiftUI
import UIKit

struct SearchView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        SearchBar(text: $searchText)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}


//SearchView from UIKit
struct SearchBar : UIViewRepresentable {
    
    
    @Binding var text: String
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.delegate = context.coordinator
        
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> SearchBar.Coordinator {
        Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    
}

