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
        HStack{
            ZStack{
                Text(navigationState.currentURL?.absoluteString ?? "(none)")
                    .padding(.horizontal)
                    .zIndex(1)
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
                        Image(systemName: "arrow.triangle.2.circlepath")
                        
//                            .transition(.slide)
                        //                    Image(systemName:"xmark")
                    })
                    .zIndex(1.0)
                }.padding(.horizontal,8)
                .transition(.slide)
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
