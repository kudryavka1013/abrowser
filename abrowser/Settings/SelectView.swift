//
//  textview.swift
//  abrowser
//
//  Created by YJY on 2021/6/23.
//

import SwiftUI

struct SelectView: View {
    
    @ObservedObject var userState : UserState
    @ObservedObject var userPreferences: UserPreferences
   
    @Binding var selectIsPresented : Bool
    @State var viewSelected : Int = 1
    
    var body: some View {
        VStack(spacing:0){
           // Spacer().frame(width: 100, height: 60)
            if (viewSelected == 1)
            {
                HStack{
                    VStack{
                        Button("登录"){
                            viewSelected = 1
                        }
                        .font(.title)
                        .foregroundColor(Color("selected"))
                        Divider()
                            .frame(width: 60, height: 2)
                            .background(Color("selected"))
                    }
                    .padding()
                    VStack{
                        Button("注册"){
                            viewSelected = 2
                        }
                        .font(.title)
                        .foregroundColor(Color("unselected"))
                        Divider()
                            .frame(width: 0, height: 1)
                            //.background(Color.white)
                    }
                    Spacer()
                }
                .padding(.bottom,8)
                .padding(.horizontal)
            }else if (viewSelected == 2)
            {
                HStack{
                    VStack{
                        Button("登录"){
                            viewSelected = 1
                        }
                        .font(.title)
                        .foregroundColor(Color("unselected"))
                        Divider()
                            .frame(width: 0, height: 2)
                            .background(Color("unselected"))
                    }
                    .padding()
                    VStack{
                        Button("注册"){
                            viewSelected = 2
                        }
                        .font(.title)
                        .foregroundColor(Color("selected"))
                        Divider()
                            .frame(width: 60, height: 2)
                            .background(Color("selected"))
                    }
                    Spacer()
                }
                .padding(.bottom,8)
                .padding(.horizontal)
            }
//            .frame(width: 300, height: 200)
           // .background(Color.red)
            
        
            ZStack{
                if (viewSelected == 1) {
                    LoginView(userState: userState, userPreferences: userPreferences, selectIsPresented: $selectIsPresented)
                }
                else {
                    RegisterView(userState: userState, viewSelected: $viewSelected)
                }
            }
        }
    }
}
//
//struct SelectView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectView(viewSelected: .constant(2))
//    }
//}
