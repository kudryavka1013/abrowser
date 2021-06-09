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
        VStack {
            HStack{
                ZStack{
                    
                    Text((((navigationState.selectedWebView?.isLoading) == true) ? navigationState.currentURL?.absoluteString : navigationState.currentTitle) ?? "none")
                        .padding(.horizontal,24)
                        .zIndex(1)
                        .lineLimit(1)
                    if(!SearchIsPresented){
                        RoundedRectangle(cornerRadius: 18,style: RoundedCornerStyle.continuous)
                            .fill(Color.white)
                            .frame(maxHeight:36)
                            .shadow(radius: 1)
                            .matchedGeometryEffect(id: "addressbar", in: addressbar)
                            .onTapGesture {
                                SearchIsPresented = true
                            }
                    }
                    HStack{
                        Spacer()
                        Button(action: {
                            navigationState.refresh()
                        }, label: {
                            if(navigationState.selectedWebView?.isLoading == true){
                                Image(systemName:"xmark")
                                    .matchedGeometryEffect(id: "refreshbtn", in: addressbar)
                            }else{
                                Image(systemName: "arrow.triangle.2.circlepath")
                                    .matchedGeometryEffect(id: "refreshbtn", in: addressbar)
                            }
                        })
                        .zIndex(1.0)
                        .transition(AnyTransition.opacity.combined(with: .slide))
                    }.padding(.horizontal,8)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 5)
        }
        
    }
}

//struct AddressBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddressBarView()
//    }
//}
