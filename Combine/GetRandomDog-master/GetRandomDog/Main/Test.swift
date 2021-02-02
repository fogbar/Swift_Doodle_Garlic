//
//  Test.swift
//  GetRandomDog
//
//  Created by 김동준 on 2021/01/29.
//  Copyright © 2021 Lawrence Tan. All rights reserved.
//

import SwiftUI
import Combine

struct LogInView: View {
    //MARK:- PROPERTIE
    
    @State var loginId : String = ""
    @State var loginPw : String = ""
    
    @ObservedObject var loginViewModel = LoginViewModel()
    
    //MARK: - BODY
    var body: some View {
        ZStack(alignment:.top){
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color(red: 26 / 255, green: 32 / 255, blue: 56 / 255))
            VStack{
                
                Spacer()
                
                ZStack(alignment:.center){
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 48, height: UIScreen.main.bounds.height / 2.5)
                        .cornerRadius(20)
                    
                    VStack(spacing:20){
                        TextField("Email", text: $loginId)
                            .padding()
//                            .background(BlurEffect(.light))
                            .cornerRadius(12)
                        
                        TextField("비밀번호", text: $loginPw)
                            .padding()
//                            .background(BlurEffect(.light))
                            .cornerRadius(12)
                            .frame(height: 50)
                        
                        HStack{
                            Spacer()
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Forgot password?")
                            })
                        }
                        .padding(.trailing, 12)
                        
                        HStack(spacing: 30){
                            Button(action: {
                                loginViewModel.signIn(loginId: self.loginId, loginPw: self.loginPw)
                                
                            }, label: {
                                Text("Sign in")
                                    .foregroundColor(.white)
                            })
                            .padding()
                            .padding(.horizontal, 12)
                            .background(Rectangle()
                                            .foregroundColor(.blue)
                                            .cornerRadius(12)
                            )
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Sign Up")
                                    .foregroundColor(.black)
                            })
                            .padding()
                            .padding(.horizontal, 12)
                            .background(Rectangle()
                                            .foregroundColor(.gray)
                                            .opacity(0.2)
                                            .cornerRadius(12)
                            )
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width - 80)
                    .shadow(radius: 3)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .offset(y: -60)
            
            Image("loading")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width - 32)
                .padding(.top , 32)
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
