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
    @ObservedObject var historyState : HistoryState
    @Binding var MenuIsPresented : Bool
    
    @State var HistoryOrBookmarkIsPresented = false
    @State var ShareIsPresented = false
    @State var viewSeleted = 1
    @State var darkMode = false
    @State var SettingsIsPresented = false
    @State var test = false
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
                    bookmarkState.addBookmark(name: navigationState.currentTitle!, url: navigationState.currentURL!.absoluteString)
                    MenuIsPresented = false
                    test = true
                }, label: {
                    VStack{
                        Image(systemName: "bookmark")
                            .padding(.bottom, 1)
                        Text("添加书签")
                            .font(.subheadline)
                    }
                }).frame(maxWidth:.infinity)
                .alert(isPresented: $test, content: {
                    Alert(title: Text("添加成功"))
                })
                
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
                    HistoryAndBookmarkView(navigationState: navigationState, historyState: historyState, bookmarkState: bookmarkState, viewSelected: $viewSeleted, isPresented : $HistoryOrBookmarkIsPresented)
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
                    HistoryAndBookmarkView(navigationState: navigationState, historyState: historyState, bookmarkState: bookmarkState, viewSelected: $viewSeleted, isPresented : $HistoryOrBookmarkIsPresented)
                })
                
                
                // 分享
                Button(action: {
                    guard let urlShare = navigationState.currentURL else { return }
                        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
                        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
                    MenuIsPresented = false
                }, label: {
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
            .padding()
            HStack{
                // 设置
                Button(action: {
                    MenuIsPresented = false
                    SettingsIsPresented = true
                }, label: {
                    VStack{
                        Image(systemName: "gearshape")
                            .padding(.bottom, 1)
                        Text("设置")
                            .font(.subheadline)
                    }
                }).sheet(isPresented: $SettingsIsPresented, content: {
                    Text("1234")
                })
                .frame(maxWidth:.infinity)
                // 浅色/深色模式
                Button(action: {
                    darkMode.toggle()
                }, label: {
                    VStack{
                        if(darkMode){
                            Image(systemName: "moon")
                                .padding(.bottom, 1)
                            Text("深色模式")
                                .font(.subheadline)

                        }else{
                            Image(systemName: "sun.max")
                                .padding(.bottom, 1)
                            Text("浅色模式")
                                .font(.subheadline)
                        }
                        
                    }
                })
                .frame(maxWidth:.infinity)
                
                Button(action: {
                    historyState.addhistory(newtitle: navigationState.currentTitle!, newUrl: navigationState.currentURL!.absoluteString)
                }, label: {
                    VStack{
                        
                            Image(systemName: "sun.max")
                                .padding(.bottom, 1)
                            Text("test")
                                .font(.subheadline)
                        
                        
                    }
                })
                .frame(maxWidth:.infinity)
                
                Button(action: {
                    historyState.localS()
                }, label: {
                    VStack{
                        
                            Image(systemName: "sun.max")
                                .padding(.bottom, 1)
                            Text("本地存")
                                .font(.subheadline)
                        
                        
                    }
                })
                .frame(maxWidth:.infinity)
                Spacer()
            }
            .padding()
            Spacer()
        }
        .frame(height: 400)
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
