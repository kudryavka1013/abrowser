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
    @Binding var SearchIsPresented : Bool
    let addressbar : Namespace.ID
    
    var body: some View {
        VStack(spacing:0) {
            ZStack{
                Rectangle()
                    .fill(Color("BackgroundColor"))
                    .frame(height:50)
                    .offset(y:-50)
                HStack{
                    ZStack{
                        Text((((navigationState.selectedWebView?.isLoading) == true) ? navigationState.currentURL?.absoluteString : navigationState.currentTitle) ?? "none")
                            .padding(.horizontal,32)
                            .zIndex(1)
                            .lineLimit(1)
                        RoundedRectangle(cornerRadius: 18,style: RoundedCornerStyle.continuous)
                            .fill(Color("AddressBarColor"))
                            .frame(maxHeight:36)
                            .shadow(radius: 1)
                            .matchedGeometryEffect(id: "addressbar", in: addressbar,isSource: true)
                            .onTapGesture {
                                SearchIsPresented = true
                            }
                        HStack{
                            Spacer()
                            Button(action: {
                                navigationState.refresh()
                            }, label: {
                                if(navigationState.selectedWebView?.isLoading == true){
                                    Image(systemName:"xmark")
                                    //                                        .matchedGeometryEffect(id: "refreshbtn", in: addressbar)
                                }else{
                                    Image(systemName: "arrow.triangle.2.circlepath")
                                    //                                        .matchedGeometryEffect(id: "refreshbtn", in: addressbar)
                                }
                            })
                            .zIndex(1.0)
                        }.padding(.horizontal,8)
                    }
                }
                .padding(.horizontal)
                .padding(.top,4)
                .padding(.bottom,8)
            }
            
            
            // 简单的网页加载进度条
            if(navigationState.selectedWebView?.estimatedProgress != 1.0){
                ProgressView(value: navigationState.selectedWebView?.estimatedProgress)
                    .progressViewStyle(LinearProgressViewStyle())
                    .frame(height: 1)
            }
            
        }
        
    }
}

//struct AddressBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddressBarView()
//    }
//}
