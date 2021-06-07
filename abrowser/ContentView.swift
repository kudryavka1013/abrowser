//
//  ContentView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/5/31.
//

import SwiftUI

struct ContentView: View {
    @StateObject var navigationState = NavigationState()
    @StateObject var bookmarkState = BookmarkState()
    @State var MenuIsPresented = false
    @State var TabManagementIsPresented = false
    var body: some View {
        ZStack{
            // 主页面
            VStack(spacing:0){
                AddressBarView(navigationState: navigationState)
                //                .background(Color.yellow)
                //                .padding()
                
                // progressbar needed!!!
                ZStack{
                    WebView(navigationState: navigationState)
                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                    Rectangle()
                        .opacity(MenuIsPresented ? 0.4 : 0)
                        .animation(.easeOut(duration: 0.2))
                        .onTapGesture {
                            MenuIsPresented = false
                        }
//                        .zIndex(1.0)
                }
                NavBarView(navigationState: navigationState, bookmarkState: bookmarkState, MenuIsPresented: $MenuIsPresented, TabManagementIsPresented: $TabManagementIsPresented)
            }
            // 标签页管理页面
            TabManagementView(navigationState: navigationState, TabManagementIsPresented: $TabManagementIsPresented)
                .opacity(TabManagementIsPresented ? 1.0 : 0)
                .animation(.easeOut(duration: 0.2))
        }
        
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            ContentView()
//                
//        }
//    }
//}
