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
    @State var showAlert = false
    @State var nameInput = ""
    @State var urlInput = ""
    var item : Bookmark
    
    var body: some View {
        VStack{
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3.0)
                .opacity(0.2)
                .padding(.top,8)
            
            Text("编辑").padding(10)
            Divider()
            TextField("标题",text: $nameInput)
                .onAppear(){
                    nameInput = item.name
                }
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(10)
            Divider()
            TextField("网址",text: $urlInput)
                .onAppear(){
                    urlInput = item.url
                }
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(10)
            Divider()
            
            HStack{
                Button("取消"){
                    EditViewIsPresented = false
                }.buttonStyle(PlainButtonStyle())
                .frame(maxWidth:.infinity, maxHeight: 32)
                Spacer()
                Divider()
                Button("保存"){
                    if (nameInput != "" && urlInput != ""){
                        bookmarkState.editBookmark(name: nameInput, url: urlInput, item: item)
                        self.showAlert = true
                    }
                    else {
                        self.showAlert = true
                    }
                }
                .alert(isPresented: $showAlert){
                    Alert(
                        title: (nameInput != "" && urlInput != "") ? Text("保存成功") : Text("保存失败") ,
                        message: (nameInput != "" && urlInput != "") ? Text("") : Text("内容不能为空"),
                        dismissButton:.default(Text("OK"), action: {
                            if (nameInput != "" && urlInput != ""){
                                EditViewIsPresented = false
                            }
                        })
                    )
                }
                .buttonStyle(PlainButtonStyle())
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
