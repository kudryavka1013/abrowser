//
//  MenuView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/2.
//

import SwiftUI

// 菜单栏
struct MenuView: View {
    @ObservedObject var navigationState : NavigationState
    @ObservedObject var bookmarkState : BookmarkState
    @Binding var MenuIsPresented : Bool
    
    @State var HistoryOrBookmarkIsPresented = false
    @State var ShareIsPresented = false
    @State var viewSeleted = 1
    var body: some View {
        VStack{
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3.0)
                .opacity(0.2)
                .padding(.top,8)
            HStack{
                // 添加书签
                Button(action: {
//                    bookmarkState.addBookmark(name: <#T##String#>, url: <#T##String#>)
                    MenuIsPresented = false
                }, label: {
                    VStack{
                        Image(systemName: "bookmark")
                            .padding(.bottom, 1)
                        Text("添加书签")
                            .font(.subheadline)
                    }
                }).frame(maxWidth:.infinity)
                
                // 书签
                Button(action: {
                    self.viewSeleted = 2
                    self.HistoryOrBookmarkIsPresented = true
                    MenuIsPresented = false
                }, label: {
                    VStack{
                        Image(systemName: "book")
                            .padding(.bottom, 1)
                        Text("书签")
                            .font(.subheadline)
                    }
                })
                .frame(maxWidth:.infinity)
                .sheet(isPresented: $HistoryOrBookmarkIsPresented, content: {
                    HistoryAndBookmarkView(navigationState: navigationState, viewSelected: $viewSeleted, isPresented : $HistoryOrBookmarkIsPresented)
                })
                
                // 历史记录
                Button(action: {
                    self.viewSeleted = 1
                    self.HistoryOrBookmarkIsPresented = true
                    MenuIsPresented = false
                }, label: {
                    VStack{
                        Image(systemName: "clock.arrow.circlepath")
                            .padding(.bottom, 1)
                        Text("历史记录")
                            .font(.subheadline)
                    }
                })
                .frame(maxWidth:.infinity)
                .sheet(isPresented: $HistoryOrBookmarkIsPresented, content: {
                    HistoryAndBookmarkView(navigationState: navigationState, viewSelected: $viewSeleted, isPresented : $HistoryOrBookmarkIsPresented)
                })
                
                
                // 分享
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    VStack{
                        Image(systemName: "square.and.arrow.up")
                            .padding(.bottom, 1)
                        Text("分享")
                            .font(.subheadline)
                    }
                }).frame(maxWidth:.infinity)
                
                // 刷新
                Button(action: {
                    navigationState.refresh()
                    MenuIsPresented = false
                }, label: {
                    VStack{
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .padding(.bottom, 1)
                        Text("刷新")
                            .font(.subheadline)
                    }
                }).frame(maxWidth:.infinity)
            }
            .frame(maxWidth:.infinity)
            .padding()
            Spacer()
        }
        .frame(height: 200)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 20)
        //        .offset(y: MenuIsPresented ? 100 : 400)
        
    }
}

//struct MenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuView()
//    }
//}
