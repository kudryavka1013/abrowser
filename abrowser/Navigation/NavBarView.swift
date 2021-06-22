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
    @ObservedObject var historyState : HistoryState
    @Binding var MenuIsPresented : Bool
    @Binding var TabManagementIsPresented : Bool
    @Binding var NavViewIsPresented : Bool
    
    @State var MenuPosition = CGSize.zero
    var body: some View {
        ZStack{
            MenuView(navigationState: navigationState, bookmarkState: bookmarkState, historyState: historyState, MenuIsPresented: $MenuIsPresented)
                .offset(y: MenuIsPresented ? -25 : 200)
                .offset(y: MenuPosition.height)
                .animation(.easeOut(duration: 0.2))
//                上下滑动
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            if(value.translation.height > 0){
                                self.MenuPosition = value.translation
                            }
                        }
                        .onEnded{ value in
                            if(value.translation.height <= 80){
                                self.MenuPosition = .zero
                            }else{
                                MenuIsPresented = false
                                self.MenuPosition = .zero
                            }
                        }
                )
            // 遮盖底部安全区域
            
            Rectangle()
                .fill(Color("BackgroundColor"))
                .frame(height: 200)
                .offset(y: 100)
            
            HStack{
                //            导航后退
                Button(action: {
                    navigationState.navGoBack()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(navigationState.canGoBack ? Color("ButtonTextColor") : Color.gray)
                })
                .frame(maxWidth: .infinity)
                .disabled(!navigationState.canGoBack)
                Spacer()
                //            导航前进
                Button(action: {
                    navigationState.navGoForward()
                }, label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(navigationState.canGoForward ? Color("ButtonTextColor") : Color.gray)
                })
                .frame(maxWidth: .infinity)
                .disabled(!navigationState.canGoForward)
                Spacer()
                //            主页
                Button(action: {
//                    NavViewIsPresented = true
                    navigationState.navGoTo(addressInput: "https://www.baidu.com")
                }, label: {
                    Image(systemName: "house")
                }).frame(maxWidth: .infinity)
                Spacer()
                //            标签页管理
                Button(action: {
                    TabManagementIsPresented = true
                }, label: {
                    Image(systemName: "square.on.square")
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
            .foregroundColor(Color("ButtonTextColor"))
            .padding()
            .padding(.horizontal)
            .background(Color("BackgroundColor"))
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
