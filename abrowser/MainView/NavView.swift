//
//  NavView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/4.
//

import SwiftUI

struct NavView: View {
    @Binding var NavViewIsPresented : Bool
    
    var body: some View {
        VStack{
            HStack{
                NavBtn(name: "百度", url: "https://www.baidu.com")
                    .padding(8)
                    .frame(maxWidth: .infinity)
                NavBtn(name: "京东", url: "https://www.baidu.com")
                    .padding(8)
                    .frame(maxWidth: .infinity)
                NavBtn(name: "淘宝", url: "https://www.baidu.com")
                    .padding(8)
                    .frame(maxWidth: .infinity)
                NavBtn(name: "搜狐", url: "https://www.baidu.com")
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
            
            HStack{
                NavBtn(name: "爱奇艺", url: "https://www.baidu.com")
                    .padding(8)
                    .frame(maxWidth: .infinity)
                NavBtn(name: "58同城", url: "https://www.baidu.com")
                    .padding(8)
                    .frame(maxWidth: .infinity)
                NavBtn(name: "虎扑", url: "https://www.baidu.com")
                    .padding(8)
                    .frame(maxWidth: .infinity)
                NavBtn(name: "哔哩哔哩", url: "https://www.baidu.com")
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
            
            HStack{
                NavBtn(name: "知乎", url: "https://www.baidu.com")
                    .padding(8)
                    .frame(maxWidth: .infinity)
                NavBtn(name: "携程", url: "https://www.baidu.com")
                    .padding(8)
                    .frame(maxWidth: .infinity)
                NavBtn(name: "美团", url: "https://www.baidu.com")
                    .padding(8)
                    .frame(maxWidth: .infinity)
                NavBtn(name: "优酷", url: "https://www.baidu.com")
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

struct NavBtn: View{
    
    var name : String
//    var icon : Image
    var url : String
    
    var body: some View{
        Button(action: {
            //跳转
        }, label: {
            VStack{
                Rectangle().frame(width: 50, height:50)
                Text(name).font(.footnote).lineLimit(1)
            }
        })
    }
}

struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView(NavViewIsPresented: .constant(true))
    }
}
