//
//  NavView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/4.
//

import SwiftUI

struct NavView: View {
    @ObservedObject var navigationState : NavigationState
    @Binding var NavViewIsPresented : Bool
    @Binding var SearchIsPresented : Bool
    @Binding var FromNavView : Bool
    let addressbar: Namespace.ID
    var body: some View {
       //
        
        VStack{
            Spacer()
            Image("主页").frame(width: 350, height:130).offset(x: 0, y: -15)
            //sousuokuang
            ZStack{
                
                RoundedRectangle(cornerRadius: 18,style: RoundedCornerStyle.continuous)
//                    .stroke(Color("PageButtonTextColor"),lineWidth: 1)
                    .fill(Color("AddressBarColor"))
                    .frame(width: 350, height: 50)
//                    .shadow(radius: 1)
                    .shadow(color: Color.black, radius: 1, x: 0, y: 0)
                    .padding()
//                    .matchedGeometryEffect(id: "addressbar", in: addressba)
                    .onTapGesture(perform: {
                        SearchIsPresented = true
                        FromNavView = true
                    })
                HStack{
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .frame(width: 20, height:20)
                        .padding(.trailing,36)
                }.padding()
            }
//            .offset(x: 0, y: -10)
            .onTapGesture {
                print("tap")
                NavViewIsPresented = false
                SearchIsPresented = true
            }
            HStack{
                NavBtn(navigationState: navigationState, name: "百度",icon: "百度",url: "https://www.baidu.com")
                    .padding(8)
                    .frame(maxWidth: .infinity)
                NavBtn(navigationState: navigationState, name: "淘宝",icon:"淘宝", url: "https://www.taobao.com")
                    .padding(8)
                    .frame(maxWidth: .infinity)
                NavBtn(navigationState: navigationState, name: "GitHub",icon:"GitHub", url: "https://github.com")
                    .padding(8)
                    .frame(maxWidth: .infinity)
                NavBtn(navigationState: navigationState, name: "京东",icon:"京东", url: "https://www.jd.com")
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }.padding(.horizontal)
            
            HStack{
                NavBtn(navigationState: navigationState, name: "微博",icon:"微博", url: "https://weibo.com")
                    .padding(8)
                    .frame(maxWidth: .infinity)
                NavBtn(navigationState: navigationState, name: "哔哩哔哩",icon:"哔哩哔哩", url: "https://www.bilibili.com")
                    .padding(8)
                    .frame(maxWidth: .infinity)
                NavBtn(navigationState: navigationState, name: "知乎",icon:"知乎", url: "https://www.zhihu.com")
                    .padding(8)
                    .frame(maxWidth: .infinity)
                NavBtn(navigationState: navigationState, name: "美团",icon:"美团", url: "https://www.meituan.com")
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }.padding(.horizontal)
            Spacer()
        }
    }
}
struct NavBtn: View{
    @ObservedObject var navigationState: NavigationState
    var name : String
    var icon : String
    var url : String
    
    var body: some View{
        Button(action: {
            if navigationState.webViews.count == 0 {
                navigationState.createNewWebView(withRequest: URLRequest(url: URL(string: url)!))
            }
            else {
                navigationState.navGoTo(addressInput: url)
            }
        }, label: {
            VStack{
                Image(icon).frame(width: 50, height:50)
                Text(name).font(.footnote).lineLimit(1)//.colorMultiply(.black)
            }.foregroundColor(Color("PageButtonTextColor"))
        })
    }
}

//struct NavView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavView( NavViewIsPresented: .constant(true), SearchIsPresented: <#Binding<Bool>#>)
//    }
//}

//magnifyingglass
//magnifyingglass.circle
//magnifyingglass.circle.fill
