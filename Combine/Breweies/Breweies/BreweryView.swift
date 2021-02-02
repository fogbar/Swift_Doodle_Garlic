//
//  BreweryView.swift
//  Breweies
//
//  Created by 김동준 on 2021/01/06.
//

import SwiftUI

struct BreweryView: View {
    private let brewery: Brewery
    
    init(brewery: Brewery) {
        self.brewery = brewery
    }
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage(named: "userProfile")!)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            
            VStack(alignment: .leading, spacing: 15) {
                Text(brewery.name)
                    .font(.system(size: 18))
                Text("\(brewery.city) - \(brewery.street)")
                    .font(.system(size: 14))
            }
        }
    }
}
//
//struct BreweryView_Previews: PreviewProvider {
//    static var previews: some View {
//        BreweryView()
//    }
//}
