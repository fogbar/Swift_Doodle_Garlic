//
//  BeerListModel.swift
//  BringMyOwnBeer🍺+Combine
//
//  Created by Bo-Young PARK on 2019/10/30.
//  Copyright © 2019 Boyoung Park. All rights reserved.
//

import Foundation
import Combine

struct BeerListModel {
    let punkNetwork: PunkNetwork
    
    init(punkNetwork: PunkNetwork = PunkNetworkImpl()) {
        self.punkNetwork = punkNetwork
    }
    
    func getBeerList(page: Int?) -> AnyPublisher<[Beer], PunkNetworkError> {
        return punkNetwork.getBeers(page: page)
    }
    
    func getPageToPatch(beers: [Beer], id: Int?) -> Int? {
        //beers.count는 page 하나당 75개일 것 임.
        let lastRowCount = beers.count
        //beers에서 appeardID와 매칭이 되는 첫 번째 index를 뽑음. index는 최대가 74임.
        let lastIndex = beers.firstIndex { id == $0.id }
        //한 페이지당 75개씩 있으니 처음에 가져왔다면 거기서 1일 더해서 page를 늘려나가면 됨.
        let page = lastRowCount / 75 + 1 //page 하나당 75개가 있어서 75로 나눔.

        //lastRowCount는 75여야 함. 이 guard 조건문은 lastRowCount가 74~325 사이여야만 통과된다는 의미.
        //아마 최대 페이지가 325까지여서 그런거 아닐까 추측해봄.
        //그리고 lastIndex는 index 자체가 0부터 시작하니 lastRowCount에서 1을 뺀 값과 같아야 함이 당연.
        //이를 모두 충족할 경우 page를 리턴.
        guard (74...325) ~= lastRowCount,
            lastRowCount - 1 == lastIndex else {
            return nil
        }
        
        return page
    }

}
