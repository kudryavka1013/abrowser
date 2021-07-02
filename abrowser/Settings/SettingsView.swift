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
    @ObservedObject var userPreferences: UserPreferences
    
    @State var loginSelected : Int = 2
    
    var body: some View {
        
        NavigationView{
            List{
                
                if (loginSelected == 1){
                    Section{
                        NavigationLink(destination:SelectView())
                        {
                            HStack {
                                Image("登陆").frame(width: 60, height: 60)
                                
                                Text("未登录").font(.title).offset( x: 20)
                            }
                        }//需添加用户管理功能
                    }
                    //                    loginSelected = 2
                }
                else if (loginSelected == 2) {
                    Section{
                        NavigationLink(destination: AccountView())
                        {
                            HStack {
                                Image("登陆").frame(width: 60, height: 60)
                                VStack {
                                    Text("张三").bold().font(.system(size:20)).offset( x : 20)
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
                    NavigationLink(destination:Text("usermanage")){
                        Text("用户管理")
                    }
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



