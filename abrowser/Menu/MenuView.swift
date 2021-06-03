//
//  MenuView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/2.
//

import SwiftUI

// 菜单栏
struct MenuView: View {
//    @Binding var MenuIsPresented : Bool
    var body: some View {
        VStack{
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3.0)
                .opacity(0.2)
                .padding(.top,8)
            HStack{
                //                添加书签 / 书签 / 历史记录 / 分享 / 刷新
                MenuItemView(image:"bookmark",label:"添加书签")
                //                Spacer()
                MenuItemView(image:"book",label:"书签")
                //                Spacer()
                MenuItemView(image:"clock.arrow.circlepath",label:"历史记录")
                //                Spacer()
                MenuItemView(image:"square.and.arrow.up",label:"分享")
                //                Spacer()
                MenuItemView(image:"arrow.triangle.2.circlepath",label:"刷新")
            }
            .frame(maxWidth:.infinity)
            .padding()
            Spacer()
        }
        .frame(height: 200)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 20)
//        .offset(y: MenuIsPresented ? 100 : 400)
        
    }
}

//struct MenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuView()
//    }
//}
