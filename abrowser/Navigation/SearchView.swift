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
    
    @State var test = ""
    @State var abc = false
    var body: some View {
        VStack{
            HStack{
                ZStack{
                    TextField(navigationState.currentURL?.absoluteString ?? "", text: $test)
                        //            Text(navigationState.currentURL?.absoluteString ?? "(none)")
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
//                    withAnimation(.easeInOut(duration: 1.0)) {
                        Text("取消")
//                            .transition(AnyTransition.opacity.combined(with: .slide))
//                    }
                })

            }
            .padding(.horizontal)
            .padding(.vertical, 5)
            Text(test)
            Button(action: {
                self.abc.toggle()
            }, label: {
                Text("Button")
            })
            Spacer()
        }
    }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
