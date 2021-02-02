//
//  BoardViewModel.swift
//  UI_Zeplin
//
//  Created by 김동준 on 2021/01/09.
//

import Foundation
import Combine
import SwiftUI

class BoardViewModel: ObservableObject {
    private let url = "https://api.openbrewerydb.org/breweries"
    private var task : AnyCancellable?
    
    private var getCount:Int = 0
    
    //Published Wrapper를 사용하여 Publisher의 역할을 할 수 있다.
    @Published var boards : [Board] = []
    
    func fetchBoards() {
        task = URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
            .map {$0.data}
            .decode(type: [Board].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \BoardViewModel.boards, on: self)
        
        print("완료 ㅋㅋ")
    }
    
    func getBoardDummy() {
        task = testSubject.sink { completion in
            switch completion {
            case .failure(let err):
                print("Err:\(err)")
            case .finished:
                print("데이터 발행 완료")
            }
        } receiveValue: { board in
            self.boards.append(contentsOf: board)
        }
        
        if self.getCount == 0 {
            testSubject.send(boardsDummy)
            self.getCount += 1
        }
    }
}


//이걸 사용해서 버튼 클릭했을때 그냥 텍스트들이 보여지게 해보자
let testSubject = PassthroughSubject<[Board], Error>()

//보여지게 할 boards 더미 데이터
let boardsDummy : [Board] = [Board(typeName: "포스터", num: 465, image: "image45", background: "4963"), Board(typeName: "모바일", num: 213, image: "image46", background: "4964"), Board(typeName: "게시판", num: 347, image: "swiftui_image", background: "")]
