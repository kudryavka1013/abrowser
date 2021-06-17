//
//  BookmarkEditView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/15.
//

import SwiftUI

struct BookmarkEditView: View {
    @State var name = ""
    @State var url = ""
    
    var body: some View {
        VStack{
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3.0)
                .opacity(0.2)
                .padding(.top,8)
            
            Text("编辑").padding(10)
            
            TextField("标题",text: $name).padding(10)
            
            TextField("网址",text: $url).padding(10)
            
            HStack{
                Button("取消"){
                    
                }.buttonStyle(PlainButtonStyle())
                .padding()
                
                Button("确定"){
                    
                }.buttonStyle(PlainButtonStyle())
                .padding()
            }
        }
    }
}

struct BookmarkEditView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkEditView()
    }
}
