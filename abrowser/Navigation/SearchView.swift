//
//  SearchView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/7.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var navigationState : NavigationState
    @Binding var SearchIsPresented : Bool
    let addressbar: Namespace.ID
    
    @State var addressInput = ""
    @State var currentURL = ""
    var body: some View {
        VStack{
            HStack{
                ZStack{
                    TextField(navigationState.currentURL?.absoluteString ?? "", text: $addressInput,onCommit: {
                        if(addressInput)
                        navigationState.navGoTo(addressInput: addressInput)
                        SearchIsPresented = false
                    })
                    .onAppear(){
                        addressInput = navigationState.currentURL?.absoluteString ?? ""
                    }
                    // 关闭自动大小写和自动更正
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    // 更改键盘样式
                    .keyboardType(.webSearch)
                    .padding(.horizontal)
                    .zIndex(1)
                    if(SearchIsPresented){
                        RoundedRectangle(cornerRadius: 18,style: RoundedCornerStyle.continuous)
                            .fill(Color.white)
                            .frame(maxHeight:36)
                            .shadow(radius: 1)
                            .matchedGeometryEffect(id: "addressbar", in: addressbar)
                    }
                    
                }
                Button(action: {
                    SearchIsPresented = false
                }, label: {
                    Text("取消")
                    
                })
                
                
            }
            .padding(.horizontal)
            .padding(.vertical, 5)

            Spacer()
        }
    }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
