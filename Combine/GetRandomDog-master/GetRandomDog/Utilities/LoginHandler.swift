//
//  AuthenticationHandler.swift
//  LoginWithSwiftUIDemo
//
//  Created by Lawrence Tan on 4/4/20.
//  Copyright © 2020 Lawrence Tan. All rights reserved.
//

import Combine
import Alamofire

class LoginHandler: APIHandler {
    
    @Published var woofResponse: WoofResponse?
    @Published var isLoading = false
            
    func getRandomDog() {
        isLoading = true
        
        let url = "https://random.dog/woof.json"
        
        AF.request(url, method: .get).responseDecodable { [weak self] (response: DataResponse<WoofResponse, AFError>) in
            guard let weakSelf = self else { return }
            
            guard let response = weakSelf.handleResponse(response) as? WoofResponse else {
                weakSelf.isLoading = false
                return
            }
                            
            weakSelf.isLoading = false
            weakSelf.woofResponse = response
        }
    }
    
}


/*
 1. getMetaData 에서 metaCode를 _menu로 하여 접근
 2. 여기에서 _menuCode가 app_admin에 접근.
 3. 여기에서 menuJson에 접근
 4. menuJson 내부에는 menuItem과 env가 있음. (env는 뭔지 모르겠지만 여기서는 menuItem만 사용하면 됨
 5. subItem에 있는게 앱에서 TabView로 가야됨.
 6. 각 TabView를 클릭하면 거기의 meta를 가지고 meta랑 table 데이터를 가져옴.
 6-1. 그래서 첫번째 앱을 들어갔을때 meta에 해당하는 실제 table 데이터를 가져오기 위해 tap을 해서 가져오도록 해야함. tap을 하든 아니면 그냥 맨 처음에 appDelegate에서 클릭해서 가져오도록 하든가.
 */
