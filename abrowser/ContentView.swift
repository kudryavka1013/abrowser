//
//  ContentView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/5/31.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userPreferences : UserPreferences
    @ObservedObject var navigationState : NavigationState
    @ObservedObject var bookmarkState : BookmarkState
    @ObservedObject var historyState : HistoryState
    @Namespace var addressbar
    
    @State var MenuIsPresented = false
    @State var TabManagementIsPresented = false
    @State var SearchIsPresented = false
    @State var NavViewIsPresented = true
    
    var body: some View {
        ZStack{
            // 主页面
            VStack(spacing:0){
                ZStack{
                    VStack(spacing:0){
                    AddressBarView(navigationState: navigationState, SearchIsPresented: $SearchIsPresented ,addressbar: addressbar)
                        .background(Color("BackgroundColor"))

                        .animation(.easeOut(duration: 0.2))
                        .transition(.opacity)
                    
                    ZStack{
                        
                        WebViewContainer(navigationState: navigationState,historyState: historyState)
                        // 遮罩
                        Rectangle()
                            .fill(Color.black)
                            .opacity(MenuIsPresented ? 0.4 : 0)
                            .animation(.easeOut(duration: 0.2))
                            .onTapGesture {
                                MenuIsPresented = false
                            }
                        //                        .zIndex(1.0)
                    }
                    }
                    if(NavViewIsPresented){
                        NavView(NavViewIsPresented: $NavViewIsPresented, SearchIsPresented: $SearchIsPresented, addressbar: addressbar)
                            .background(Color("PageBackgroundColor"))
                    }
                }
                
                NavBarView(navigationState: navigationState, bookmarkState: bookmarkState, historyState: historyState, MenuIsPresented: $MenuIsPresented, TabManagementIsPresented: $TabManagementIsPresented, NavViewIsPresented: $NavViewIsPresented)
            }
            
            // 标签页管理页面
            if(TabManagementIsPresented){
                TabManagementView(navigationState: navigationState, TabManagementIsPresented: $TabManagementIsPresented)
                    .background(Color("HomePageBackgroundColor"))
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.2)))
            }
            // 搜索
            if(SearchIsPresented){
                SearchView(navigationState: navigationState, userPreferences: userPreferences, SearchIsPresented: $SearchIsPresented, NavViewIsPresented: $NavViewIsPresented, addressbar: addressbar)
                    .background(Color("BackgroundColor"))
                    .animation(.easeOut(duration: 0.2))
                    .transition(.opacity)
            }
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
