//
//  BeerListViewModel.swift
//  BringMyOwnBeer🍺+Combine
//
//  Created by Bo-Young PARK on 2019/10/14.
//  Copyright © 2019 Boyoung Park. All rights reserved.
//

import Combine
import SwiftUI

class BeerListViewModel: ObservableObject {
    //ViewModel -> View
    @Published var beers: [Beer] = []
    @Published var showingAlert: Bool = false
    @Published var errorMessage: String = ""
    
    //View -> ViewModel
    let appearedID = PassthroughSubject<Int?, PunkNetworkError>()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(model: BeerListModel = BeerListModel()) {
        let loadBeerList = appearedID
            //map을 통해서 page(=Int 값) 리턴. -> map은 element(=요소, 값)을 publish
            .map { model.getPageToPatch(beers: self.beers, id: $0) }
            //subject의 data 형이 Int? 이므로 optional도 체크
            //filter는 조건에 일치하는 요소들을 다시 publish 함.
            .filter { $0 != nil }
            //AnyPublisher로 변경
            .eraseToAnyPublisher()
        
        //pubisher를 subscribe 해서  cancellable에 넘김.
        loadBeerList
            .prepend(nil)
            //flatMap는 다른 map과 다르게 값이 아닌 publisher를 반환.
            //매개변수로 maxPublishers를 지정해주면 최대 몇 개의 publisher를 만들어낼 것인지 최대 갯수를 지정해주는 것.
            //특징
            //1. 모든 publisher를 성공적으로 완료해도 전체 스트림이 완료되지 않음
            //하지만 새로운 publisher를 만들어내는데 실패하면 전체 스트림이 실패
            //이 외의 상황에서는 maxPublisher의 갯수만큼 실행하고, 계속 스트림이 살아있는 상태임.
            //그래서 model.getBeerList를 통해 AnyPublisher<[Beer], PunkNetworkError>를 리턴한다.
            .flatMap(model.getBeerList)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: {
                    //failure 발생하면 에러 노출.
                    guard case .failure(let error) = $0 else { return }
                    self.beers = []
                    self.showingAlert = true
                    self.errorMessage = error.message ?? "에러 발생🚨"
                },
                receiveValue:  { beers in
                    //방금 받아온 [beer]를 기존의 beers 배열에 추가한다.
                    self.beers += beers
                }
            )
            //cancellables Set에 추가
            .store(in: &cancellables)
    }
}
