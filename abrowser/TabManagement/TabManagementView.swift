//
//  TabManagementView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/3.
//

import SwiftUI

struct TabManagementView: View {
    @ObservedObject var navigationState: NavigationState
    @Binding var TabManagementIsPresented : Bool
    var body: some View {
        VStack(spacing:0){
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(navigationState.webViews,id:\.self) { tab in
                        let idx = navigationState.webViews.firstIndex(of: tab)
                        VStack(spacing: 0.0) {
                            HStack {
                                Text(tab.url?.absoluteString ?? "?").lineLimit(1)
                                    .foregroundColor(Color("PageButtonTextColor"))
                                Spacer()
                                Button(action: {
                                    navigationState.deleteWebView(tab: tab)
                                }, label: {
                                    Image(systemName: "xmark")
                                        .foregroundColor(Color("PageButtonTextColor"))
                                })
                            }
                            .padding(8)
                            .background(Color("TabManagementBarColor"))
                            Image(uiImage: navigationState.images[idx!])
                                .resizable()
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.8).cornerRadius(8).shadow(radius: 5)
                        .padding(.leading,idx == 0 ? UIScreen.main.bounds.width * 0.1 : 0)
                        .padding(.trailing,idx == navigationState.webViews.count - 1 ? UIScreen.main.bounds.width * 0.1 : 0)
                        .padding(.vertical, 8)
                        .animation(
                            .spring(response: 0.3, dampingFraction: 0.7, blendDuration: 0))
                        .onTapGesture {
                            navigationState.selectedWebView = tab
                            TabManagementIsPresented = false
                        }
                    }
                }
            }
            .padding(.vertical,72)
            .background(Color("ViewColor"))
            
            HStack{
                Button(action: {
                    navigationState.deleteAllWebViews()
                    TabManagementIsPresented = false
                }, label: {
                    Text("全部关闭")
                }).frame(minWidth: 80,alignment: .leading)
                Spacer()
                Button(action: {
                    navigationState.createNewWebView(withRequest: URLRequest(url: URL(string: "about:newtab")!))
                    TabManagementIsPresented = false
                }, label: {
                    Image(systemName: "plus")
                }
                )
                Spacer()
                Button(action: {
                    TabManagementIsPresented = false
                }, label: {
                    Text("返回")
                }).frame(minWidth: 80 ,alignment: .trailing)
            }
            .padding()
            .background(Color("ViewColor"))
        }
        .onAppear{
            if(navigationState.webViews.count == 0){
                navigationState.createNewWebView(withRequest: URLRequest(url: URL(string: "about:newtab")!))
            }
        }
    }
}
