//
//  SettingsView.swift
//  abrowser
//
//  Created by wiz on 2021/6/16.
//

import SwiftUI
import UIKit


struct SettingsView: View {
    var body: some View {
        
        NavigationView{
            List{
                Section{
                    NavigationLink(destination:SelectView())
                        {
                        Text("用户管理")
                        
                    }//需添加用户管理功能
                }
                Section{
                NavigationLink(destination:homePageSettings()){
                    Text("主页设置")
                }//需添加主页设置功能
              
                
                NavigationLink(destination:searchEngineSettings()){Text("搜索引擎设置")}//需添加搜索引擎功能
                NavigationLink(destination:Text("downLoadSettings"))
                    {Text("下载设置")}//需添加下载设置功能
                }
            }
            .navigationBarTitle(Text("设置"),displayMode:.inline)
//            .navigationBarItems(leading:Button("返回"){})//需添加返回功能
            .listStyle(InsetGroupedListStyle())
        }
 
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
//主页设置


struct homePageSettings: View {
    @State private var showAlert=false
    @State var linkIsSelected=0
    @State var newURL : String = "www.baidu.com"

    var body: some View{
            List {
                HStack{
                    Button(action:{
                        linkIsSelected = 0
                    }){Text("默认主页")}
                    Spacer()
                    if(linkIsSelected == 0){
                        Image(systemName: "checkmark")
                    }
                }
                HStack{
                    Button(action:{
                        linkIsSelected = 1
                    }){Text("空白页")}
                    Spacer()
                    if(linkIsSelected == 1){
                        Image(systemName: "checkmark")
                    }
                }
                HStack{
                    Button(action:{
                        linkIsSelected = 2
                        self.showAlert.toggle()
                        
                    }){
                        VStack(){
                            Text("自定义网址")
                            
                            Text(newURL)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }}
                    Spacer()
                    if(linkIsSelected == 2){
                        Image(systemName: "checkmark")
                    }
                }
                
            }.navigationBarTitle(Text("主页设置"),displayMode: .inline)
            
            constumURL(isPresented: $showAlert, newURL: $newURL)
                .opacity(showAlert ? 1:0)
        }
    }

//主页设置/自定义页面弹窗
struct constumURL: View{
    
    @Binding var isPresented: Bool
    @State var text = ""
    @Binding var newURL : String
    var body: some View{
        VStack{
            Text("自定义网址")
                .foregroundColor(.accentColor)
                .fontWeight(.bold)
                .padding(.top,12)
                .accentColor(.black)
            
            TextField("请输入网址", text:$text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width:230)
                .padding(.vertical,8)
            Divider()
            HStack(){
                Button("取消"){
                    self.isPresented.toggle()
                }.frame(maxWidth:.infinity)
                Divider()
                Button(action:{
                    newURL = text
                    self.isPresented.toggle()
                },label:{Text("保存")}).frame(maxWidth:.infinity)
                
            }.padding(.bottom,12)
            
            
        }
        .frame(width: 260, height:140)
        .background(Color(red: 235/255, green: 235/255, blue: 235/255, opacity: 1.0))
        .cornerRadius(12.0)
        
    }
}
/*
 extension View{
 func showAlert(isPresented: Binding<Bool>) -> some View {
 self.modifier(TextAlertVM(isPresented:isPresented))
 }
 }
 struct TextAlertVM: ViewModifier{
 @Binding var isPresented:Bool
 func body(content:Content)-> some View{
 ZStack{
 content
 .disabled(self.isPresented)
 .blur(radius: self.isPresented ? 6:0)
 if isPresented{
 constumURL(isPresented: $isPresented)
 .zIndex(1)
 }
 }
 }
 }
 //自定义网址end
 */
//搜索引擎设置
struct searchEngineSettings: View {
    //    @ObservedObject var userPreferences
    @State var engineIsSelected = 0
    var body :some View{
        List{
            HStack{
                Button(action:{
                    engineIsSelected = 0
                }){Text("百度")}
                Spacer()
                if(engineIsSelected == 0){
                    Image(systemName: "checkmark")
                }
            }
            //
            HStack{
                Button(action:{
                    engineIsSelected = 1
                }){Text("搜狗")}
                Spacer()
                if(engineIsSelected == 1){
                    Image(systemName: "checkmark")
                }
            }
            HStack{
                Button(action:{
                    engineIsSelected = 2
                }){Text("必应")}
                Spacer()
                if(engineIsSelected == 2){
                    Image(systemName: "checkmark")
                }
            }
        }
        .navigationBarTitle(Text("搜索引擎设置"),displayMode: .inline)
    }
}



