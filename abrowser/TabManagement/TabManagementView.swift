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
        List {
            ForEach(navigationState.webViews, id: \.self) { tab in
                Button(action: {
                    navigationState.selectedWebView = tab
                    TabManagementIsPresented = false
                }) {
                    Text(tab.url?.absoluteString ?? "?")
                }
            }
        }
        HStack{
            Button(action: {}, label: {
                Text("全部关闭")
            }).frame(minWidth: 80,alignment: .leading)
            Spacer()
            Button(action: {
                navigationState.createNewWebView(withRequest: URLRequest(url: URL(string: "https://www.baidu.com")!))
                TabManagementIsPresented = false
            }, label: {
                Image(systemName: "plus")
            })
            Spacer()
            Button(action: {
                TabManagementIsPresented = false
            }, label: {
                Text("返回")
            }).frame(minWidth: 80 ,alignment: .trailing)
        }.padding()
    }
}

//struct TabManagementView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabManagementView()
//    }
//}
