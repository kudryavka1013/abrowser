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
                    NavigationLink(destination:homePageSettings(userPreferences: userPreferences)){
                        Text("主页设置")
                    }
                    NavigationLink(destination:Text("usermanage")){
                        Text("用户管理")
                    }
                    NavigationLink(destination:searchEngineSettings(userPreferences: userPreferences)){
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

//主页设置
struct homePageSettings: View {
    @ObservedObject var userPreferences : UserPreferences
    
    @State private var showAlert = false
    //    @State var linkIsSelected = 0
    
    var body: some View{
        ZStack{
            
        List {
            HStack{
                Button(action:{
                    //                    linkIsSelected = 0
                    userPreferences.setHomePageType(type: 0)
                }){
                    Text("默认主页")
                }
                Spacer()
                if(userPreferences.homePageType == 0){
                    Image(systemName: "checkmark")
                        .foregroundColor(Color.blue)
                }
            }
            HStack{
                Button(action:{
                    //                    linkIsSelected = 1
                    userPreferences.setHomePageType(type: 1)
                }){Text("空白页")}
                Spacer()
                if(userPreferences.homePageType == 1){
                    Image(systemName: "checkmark")
                        .foregroundColor(Color.blue)
                }
            }
            HStack{
                Button(action:{
                    //                    linkIsSelected = 2
                    userPreferences.setHomePageType(type: 2)
                    self.showAlert.toggle()
                }){
                    VStack(alignment: .leading){
                        Text("自定义网址")
                        Text(userPreferences.customPage)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                    }
                }
                Spacer()
                if(userPreferences.homePageType == 2){
                    Image(systemName: "checkmark")
                        .foregroundColor(Color.blue)
                }
            }
            
        }
        .navigationBarTitle(Text("主页设置"),displayMode: .inline)
        
        Rectangle()
                .fill(Color.black)
                .opacity(showAlert ? 0.4 : 0)
                .animation(.easeOut(duration: 0.1))
            
            editConstumURL(userPreferences: userPreferences, isPresented: $showAlert)
            .opacity(showAlert ? 1 : 0)
            .animation(.easeIn(duration: 0.1))
        }
        .onDisappear(){
            print("save userPreferences")
            userPreferences.savePreferencesToLocal()
        }
    }
}

//主页设置/自定义页面弹窗
struct editConstumURL: View{
    @ObservedObject var userPreferences : UserPreferences
    @Binding var isPresented: Bool
    @State var newURL : String = ""
    var body: some View{
        VStack{
            Text("自定义网址")
                .foregroundColor(.accentColor)
                .fontWeight(.bold)
                .padding(.top,12)
                .accentColor(.black)
            
            TextField("请输入网址", text:$newURL)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width:230)
                .padding(.vertical,8)
                .onAppear{
                    newURL = userPreferences.customPage
                }
            Divider()
            HStack(){
                Button("取消"){
                    self.isPresented = false
                }.frame(maxWidth:.infinity)
                Divider()
                Button(action:{
                    userPreferences.setCustomPage(newURL: newURL)
                    userPreferences.changeHomePage()
                    self.isPresented = false
                },label:{
                    Text("保存")
                }).frame(maxWidth:.infinity)
                
            }.padding(.bottom,12)
            
            
        }
        .frame(width: 260, height:140)
        .background(Color(red: 235/255, green: 235/255, blue: 235/255, opacity: 1.0))
        .cornerRadius(12.0)
        
    }
}

//搜索引擎设置
struct searchEngineSettings: View {
    @ObservedObject var userPreferences : UserPreferences
    //    @State var engineIsSelected = 0
    
    var body :some View{
        List{
            HStack{
                Button(action:{
                    //                    engineIsSelected = 0
                    userPreferences.setSearchEngineType(type: 0)
                }){Text("百度")}
                Spacer()
                if(userPreferences.searchEngineType == 0){
                    Image(systemName: "checkmark")
                        .foregroundColor(Color.blue)
                }
            }
            HStack{
                Button(action:{
                    //                    engineIsSelected = 1
                    userPreferences.setSearchEngineType(type: 1)
                }){Text("搜狗")}
                Spacer()
                if(userPreferences.searchEngineType == 1){
                    Image(systemName: "checkmark")
                        .foregroundColor(Color.blue)
                }
            }
            HStack{
                Button(action:{
                    //                    engineIsSelected = 2
                    userPreferences.setSearchEngineType(type: 2)
                }){Text("必应")}
                Spacer()
                if(userPreferences.searchEngineType == 2){
                    Image(systemName: "checkmark")
                        .foregroundColor(Color.blue)
                }
            }
        }
        .navigationBarTitle(Text("搜索引擎设置"),displayMode: .inline)
        .onDisappear(){
            print("save userPreferences")
            userPreferences.savePreferencesToLocal()
        }
    }
}


