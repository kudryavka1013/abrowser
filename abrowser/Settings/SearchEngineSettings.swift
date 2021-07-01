//
//  SearchEngineSettings.swift
//  abrowser
//
//  Created by YJY on 2021/7/1.
//

import SwiftUI

//搜索引擎设置
struct SearchEngineSettings: View {
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

//
//
//
//struct SearchEngineSettings_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchEngineSettings()
//    }
//}
