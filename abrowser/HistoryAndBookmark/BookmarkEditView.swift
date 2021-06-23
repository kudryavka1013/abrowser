//
//  BookmarkEditView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/15.
//

import SwiftUI

struct BookmarkEditView: View {
    @ObservedObject var bookmarkState : BookmarkState
    @Binding var EditViewIsPresented : Bool
    var item : Bookmark
    @State var nameInput = ""
    @State var urlInput = ""
    
    var body: some View {
        VStack{
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3.0)
                .opacity(0.2)
                .padding(.top,8)
            
            Text("编辑").padding(10)
            Divider()
            TextField("标题",text: $nameInput).padding(10)
            Divider()
            TextField("网址",text: $urlInput).padding(10)
            Divider()
            
            HStack{
                Button("取消"){
                    EditViewIsPresented = false
                }.buttonStyle(PlainButtonStyle())
                .frame(maxWidth:.infinity, maxHeight: 32)
                Spacer()
                Divider()
                Button("确定"){
                    
                    EditViewIsPresented = false
                }.buttonStyle(PlainButtonStyle())
                .frame(maxWidth:.infinity, maxHeight: 32)
            }
        }.frame(height: 280)
    }
}

//struct BookmarkEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookmarkEditView(bookmarkState: bookmarkState, EditViewIsPresented: $EditViewIsPresented,item: item)
//    }
//}
