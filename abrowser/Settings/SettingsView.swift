//
//  SettingsView.swift
//  abrowser
//
//  Created by wiz on 2021/6/16.
//

import SwiftUI
import UIKit

// 一级设置页
struct SettingsView: View {
    
    @Binding var isPresented: Bool
    @State var selectIsPresented: Bool = false
    @ObservedObject var userPreferences: UserPreferences
    @ObservedObject var userState : UserState
    
//    @State var loginSelected : Int = 1
    
    var body: some View {
        
        NavigationView{
            List{
                if (userState.isLogin == false){
                    Section{
                        NavigationLink(destination:SelectView(userState: userState, userPreferences: userPreferences,selectIsPresented: $selectIsPresented),isActive:$selectIsPresented)
                        {
                            HStack {
                                Image("登录").frame(width: 60, height: 60)
                                
                                Text("未登录").font(.title).offset( x: 20)
                            }
                        }//需添加用户管理功能
                    }
                    //                    loginSelected = 2
                }
                else if (userState.isLogin == true) {
                    Section{
                        NavigationLink(destination: AccountView(userState: userState,selectIsPresented: $selectIsPresented),isActive:$selectIsPresented)
                        {
                            HStack {
                                Image("登录成功").frame(width: 60, height: 60)
                                VStack {
                                    Text(userState.username).bold().font(.system(size:20)).offset( x : 20)
                                    Text("用户设置").font(.system(size:15)).offset( x : 30)
                                }
                            }
                        }//需添加用户管理功能
                    }
                }
                
                Section{
                    NavigationLink(destination:HomePageSettings(userPreferences: userPreferences)){
                        Text("主页设置")
                    }
//                    NavigationLink(destination:Text("usermanage")){
//                        Text("用户管理")
//                    }
                    NavigationLink(destination:SearchEngineSettings(userPreferences: userPreferences)){
                        Text("搜索引擎设置")
                    }
                }
                
            }
            .navigationBarTitle(Text("设置"),displayMode:.inline)
            .navigationBarItems(trailing: Button("完成"){ isPresented = false })
            .listStyle(GroupedListStyle())
            
            
            //            .navigationBarItems(leading:Button("返回"){})//需添加返回功能
            //            .listStyle(GroupedListStyle())
        }
    }
}
//
//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView(isPresented: .constant(true))
//    }
//}



