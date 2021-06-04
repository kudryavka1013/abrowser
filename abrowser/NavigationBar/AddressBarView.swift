//
//  AddressBarView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/1.
//

import SwiftUI

// 头部地址栏
struct AddressBarView: View {
    @ObservedObject var navigationState : NavigationState
    @State private var inputMessage = ""
    @State private var urlString = ""
    var body: some View {
        HStack{
            ZStack{
                //                Text(navigationState.currentURL?.absoluteString ?? "(none)")
                TextField(navigationState.currentURL?.absoluteString ?? "(none)", text: $inputMessage)
                    //                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    //                    .cornerRadius(16.0)
                    .padding(.horizontal)
                    .zIndex(1)
                //                    .background(Color.blue)
                //                    .shadow(radius: 10)
                RoundedRectangle(cornerRadius: 18,style: RoundedCornerStyle.continuous)
                    .fill(Color.white)
                    .frame(maxHeight:36)
                    .shadow(radius: 1)
                //                    .border(Color.gray)
                
                
            }
            ZStack{
                Button(action: {
                    navigationState.refresh()
                }, label: {
                    Image(systemName: "arrow.triangle.2.circlepath")
                    //                    Image(systemName:"xmark")
                })
                .zIndex(1.0)
                Circle()
                    .fill(Color.white)
                    .frame(maxWidth: 36, maxHeight:36)
                    .shadow(radius: 1)
            }
            
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
        
    }
}

//struct AddressBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddressBarView()
//    }
//}
