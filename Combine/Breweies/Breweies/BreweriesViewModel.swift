//
//  BreweriesViewModel.swift
//  Breweies
//
//  Created by 김동준 on 2021/01/06.
//

import Foundation
import SwiftUI
import Combine

class BreweriesViewModel: ObservableObject {
    private let url = "https://api.openbrewerydb.org/breweries"
    private var task: AnyCancellable?
    
    //Published Wrapper를 사용하여 Publisher의 역할을 할 수 있다.
    @Published var breweries: [Brewery] = []
    
    func fetchBreweries() {
        task = URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
            .map { $0.data } // -> dataTaskPublisher는 data와 error 둘 중 하나를 리턴한다. map을 통해 리턴하는 값의 data만 뽑아내는 것이다.
            //리턴형인 DataTaskPublisher는 $0은 Output이고, $1은 에러이다.
            //$0은 다시 data와 response로 나뉘는데, 여기서는 data만 뽑아쓴다. response의 경우 statusCode 같은 것을 뽑아낼때 사용하는 것 같다.
            .decode(type: [Brewery].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \BreweriesViewModel.breweries, on: self) //publisher로 부터 받아온 각 element 들을 on: 매개변수에 있는 특정 객체 내부의 property에 할당한다.
    }
}




