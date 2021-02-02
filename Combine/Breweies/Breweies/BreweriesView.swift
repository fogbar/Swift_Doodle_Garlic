//
//  BreweriesView.swift
//  Breweies
//
//  Created by 김동준 on 2021/01/06.
//

import SwiftUI

struct BreweriesView: View {
    @ObservedObject var viewModel = BreweriesViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.breweries, id: \.self) {
                BreweryView(brewery: $0)
            }.navigationTitle("Breweries")
                .onAppear {
                    self.viewModel.fetchBreweries()
            }
        }
    }
}

struct BreweriesView_Previews: PreviewProvider {
    static var previews: some View {
        BreweriesView()
    }
}
