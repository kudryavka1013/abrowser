//
//  MenuItemView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/2.
//

import SwiftUI

struct MenuItemView: View {
    @State var image :String
    @State var label :String
    @Binding var isPresented : Bool
    var body: some View {
        Button(action: {
            isPresented = true
        }, label: {
            VStack{
                Image(systemName: image)
                    .padding(.bottom, 1)
                Text(label)
                    .font(.subheadline)
            }
        })
//            .sheet(isPresented: $isPresented, content: {
//            HistoryAndBookmarkView(isPresented: $isPresented) //将创建的自定义视图作为模态窗口的内容
//        })
//            .frame(maxWidth: .infinity)
    }
}

//struct MenuItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuItemView(image:"bookmark",label:"添加书签")
//    }
//}
