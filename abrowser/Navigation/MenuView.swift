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
    @ObservedObject var userPreferences : UserPreferences
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
                    if(navigationState.webViews.count == 0){
                        navigationState.createNewWebView(withRequest: URLRequest(url: URL(string: "about:newtab")!))
                    }
                    bookmarkState.addBookmark(name: navigationState.currentTitle!, url: navigationState.currentURL!.absoluteString)
                    MenuIsPresented = false
                    test = true
                }, label: {
                    VStack{
                        Image(systemName: "bookmark")
                            .padding(.bottom, 1)
                        
                        Text("添加书签")
                            .font(.footnote)
                    }
                    .foregroundColor(Color("ButtonTextColor"))
                    
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
                            .font(.footnote)
                    }
                    .foregroundColor(Color("ButtonTextColor"))
                    
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
                            .font(.footnote)
                        
                    }
                    .foregroundColor(Color("ButtonTextColor"))
                    
                })
                .frame(maxWidth:.infinity)
                .sheet(isPresented: $HistoryOrBookmarkIsPresented, content: {
                    HistoryAndBookmarkView(navigationState: navigationState, historyState: historyState, bookmarkState: bookmarkState, viewSelected: $viewSeleted, isPresented : $HistoryOrBookmarkIsPresented)
                })
                
                
                
                
                // 刷新
                Button(action: {
                    navigationState.refresh()
                    MenuIsPresented = false
                }, label: {
                    VStack{
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .padding(.bottom, 1)
                        Text("刷新")
                            .font(.footnote)
                    }
                    .foregroundColor(Color("ButtonTextColor"))
                    
                }).frame(maxWidth:.infinity)
            }
            .padding()
            HStack{
                
                // 新建标签页
                Button(action: {
                    //                    let bundlePath = Bundle.main.bundlePath
                    //                    let path = "file://\(bundlePath)/html/nav.html"
                    //                    navigationState.createNewWebView(withRequest: URLRequest(url: URL(string: path)!))
                    navigationState.createNewWebView(withRequest: URLRequest(url: URL(string: "about:newtab")!))
                    MenuIsPresented = false
                }, label: {
                    VStack{
                        Image(systemName: "plus.rectangle.on.rectangle")
                            .padding(.bottom, 1)
                        Text("新建标签页")
                            .font(.footnote)
                    }
                    .foregroundColor(Color("ButtonTextColor"))
                })
                .frame(maxWidth:.infinity)
                
                // 看图模式
                Button(action: {
                    if(navigationState.webViews.count == 0){
                        navigationState.createNewWebView(withRequest: URLRequest(url: URL(string: "about:newtab")!))
                    }
                    navigationState.isPreviewing = true
                    MenuIsPresented = false

                }, label: {
                    VStack{
                        Image(systemName: "photo.on.rectangle")
                            .padding(.bottom, 1)
                        Text("看图模式")
                            .font(.footnote)
                    }
                    .foregroundColor(Color("ButtonTextColor"))
                })
                .frame(maxWidth:.infinity)
                
                // 设置
                Button(action: {
                    MenuIsPresented = false
                    SettingsIsPresented = true
                }, label: {
                    VStack{
                        Image(systemName: "gearshape")
                            .padding(.bottom, 1)
                        Text("设置")
                            .font(.footnote)
                    }
                    .foregroundColor(Color("ButtonTextColor"))
                    
                }).sheet(isPresented: $SettingsIsPresented, content: {
                    SettingsView(isPresented: $SettingsIsPresented, userPreferences: userPreferences)
                })
                .frame(maxWidth:.infinity)
                

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
                            .font(.footnote)
                        
                    }
                    .foregroundColor(Color("ButtonTextColor"))
                    
                })
                .frame(maxWidth:.infinity)
                
            }
            .padding()
            Spacer()
        }
        .frame(height: 400)
        .background(Color("ViewColor"))
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
