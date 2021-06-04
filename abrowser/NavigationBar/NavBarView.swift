//
//  NavBarView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/1.
//

import SwiftUI

// 底部导航栏
struct NavBarView: View {
    @ObservedObject var navigationState : NavigationState
    @ObservedObject var bookmarkState : BookmarkState
    @State private var MenuIsPresented = false
    @State private var TabManagementIsPresented = false
    var body: some View {
        ZStack{
            MenuView(navigationState: navigationState, bookmarkState: bookmarkState, MenuIsPresented: $MenuIsPresented)
                .offset(y: MenuIsPresented ? -50 : 100)
                .animation(.easeOut(duration: 0.2))
            
            // 遮盖底部安全区域
            Rectangle()
                .fill(Color(red: 235/255, green: 235/255, blue: 235/255, opacity: 1.0))
                .frame(height: 200)
                .offset(y: 100)
            
            HStack{
                //            导航后退
                Button(action: {
                    navigationState.navGoBack()
                }, label: {
                    Image(systemName: "chevron.left")
                }).frame(maxWidth: .infinity)
                Spacer()
                //            导航前进
                Button(action: {
                    navigationState.navGoForward()
                }, label: {
                    Image(systemName: "chevron.right")
                }).frame(maxWidth: .infinity)
                Spacer()
                //            主页
                Button(action: {}, label: {
                    Image(systemName: "house")
                }).frame(maxWidth: .infinity)
                Spacer()
                //            标签页管理
                Button(action: {
                    self.TabManagementIsPresented = true
                }, label: {
                    Image(systemName: "square.on.square")
                })
                .sheet(isPresented: $TabManagementIsPresented, content: {
                    TabManagementView(navigationState: navigationState, TabManagementIsPresented: $TabManagementIsPresented)
                })
                .frame(maxWidth: .infinity)
                Spacer()
                //            菜单
                Button(action: {
                    self.MenuIsPresented.toggle()
                }, label: {
                    Image(systemName: "slider.vertical.3")
                }).frame(maxWidth: .infinity)
            }
            .foregroundColor(Color.gray)
            .padding()
            .padding(.horizontal)
            .background(Color(red: 235/255, green: 235/255, blue: 235/255, opacity: 1.0))
            .frame(height:50)
        }
        .frame(maxHeight:50)
    }
}

//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavBarView()
//    }
//}
