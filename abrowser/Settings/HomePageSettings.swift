//
//  HomePageSettings.swift
//  abrowser
//
//  Created by YJY on 2021/6/29.
//

import SwiftUI
//主页设置
struct HomePageSettings: View {
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
//                .foregroundColor(.accentColor)
                .fontWeight(.bold)
                .padding(.top,12)
//                .accentColor(.black)
            
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
        .background(Color("BackgroundColor"))
        .cornerRadius(12.0)
        
    }
}
