//
//  textview.swift
//  abrowser
//
//  Created by YJY on 2021/6/23.
//

import SwiftUI

struct SelectView: View {
    
    @Binding var viewSelected : Int
    
    var body: some View {
        VStack(spacing:0){
            HStack{
                Button("登陆"){
                    viewSelected = 1
                }.font(.title)
                .padding()
                Button("注册"){
                    viewSelected = 2
                }.font(.title)
                Spacer()
            }
            .padding(.bottom,8)
            .padding(.horizontal)
//            .frame(width: 300, height: 200)
           // .background(Color.red)
            
        
            ZStack{
                if (viewSelected == 1) {
                    LoginView()
                }
                else {
                    RegisterView()
                }
            }
        }
    }
}

struct SelectView_Previews: PreviewProvider {
    static var previews: some View {
        SelectView(viewSelected: .constant(1))
    }
}
