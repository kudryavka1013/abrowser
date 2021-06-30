//
//  homePageSettings.swift
//  abrowser
//
//  Created by YJY on 2021/6/29.
//

import SwiftUI

struct homePageSettings: View {
    @ObservedObject var userPreferences : UserPreferences
    
    @State private var showAlert = false
//    @State var linkIsSelected = 0
    @State var newURL: String = "www.baidu.com"
    
    var body: some View{
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
//
//struct homePageSettings_Previews: PreviewProvider {
//    static var previews: some View {
//        homePageSettings(userPreferences: <#UserPreferences#>)
//    }
//}
