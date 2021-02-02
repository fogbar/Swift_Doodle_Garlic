//
//  PopularBoardViewModel.swift
//  UI_Zeplin
//
//  Created by 김동준 on 2021/01/11.
//

import Foundation
import SwiftUI
import Combine


class PopularBoardViewModel : ObservableObject {
    private let url = ""
    private var task : AnyCancellable?
    
    private var getCount: Int = 0
    
    @Published var popularBoards: [PopularBoard] = []
    
    
    func fetchPopularBoards() {
        return task = URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
            .map { $0.data }
            .decode(type: [PopularBoard].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \PopularBoardViewModel.popularBoards, on: self)
        
    }
    
    func getPopularBoards() {
        task = testSubject2.sink { completion in
            switch completion {
            case .failure(let err):
                print("Err:\(err)")
            case .finished:
                print("데이터 발행 완료")
            }
        } receiveValue: { popularBoard in
            self.popularBoards.append(contentsOf: popularBoard)
        }
        
        if self.getCount == 0 {
            testSubject2.send(populardBoardsDummy)
            self.getCount += 1
        }
    }
}

let testSubject2 = PassthroughSubject<[PopularBoard], Error>()

let populardBoardsDummy = [PopularBoard(image: "image32", title: "패키지 디자인", subTitle: "팔로워 294K"), PopularBoard(image: "image33", title: "3D 캐릭터", subTitle: "팔로워 238K"), PopularBoard(image: "4963", title: "테스트", subTitle: "테에스트")]
