//
//  MenuView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/2.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack{
            HStack{
//                添加书签 / 书签 / 历史记录 / 分享 / 刷新
                MenuItemView(image:"bookmark",label:"添加书签")
                Spacer()
                MenuItemView(image:"book",label:"书签")
                Spacer()
                MenuItemView(image:"clock.arrow.circlepath",label:"历史记录")
                Spacer()
                MenuItemView(image:"square.and.arrow.up",label:"分享")
                Spacer()
                MenuItemView(image:"arrow.triangle.2.circlepath",label:"刷新")
            }.frame(maxWidth:.infinity).padding()
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
