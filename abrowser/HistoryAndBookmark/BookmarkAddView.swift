//
//  BookmarkAddView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/18.
//

import SwiftUI

struct BookmarkAddView: View {
    @ObservedObject var bookmarkState : BookmarkState
    @Binding var isPresented:Bool
    @State var text = ""
    
    var body: some View {
        VStack{
            Text("新建文件夹")
                .foregroundColor(.accentColor)
                .fontWeight(.bold)
                .padding(.top,12)
                .accentColor(.black)
            
            TextField("请输入文件夹名称", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width:230)
                .padding(.vertical,8)
            Divider()
            HStack{
                Button("取消"){
                    self.isPresented.toggle()
                }.frame(maxWidth:.infinity)
                Divider()
                Button(action: {
                    if (text != ""){
                        bookmarkState.addFolder(name: text)
                    }
                    self.isPresented.toggle()
                }, label: {
                    Text("保存")
                }).frame(maxWidth:.infinity)
            }.padding(.bottom,12)
            
        }
        .frame(width:260, height: 140)
        .background(Color(red: 235/255, green: 235/255, blue: 235/255, opacity: 1.0))
        .cornerRadius(12.0)
        
        // .background(Color.white)
        
        //   .border(Color.gray,width: 4)
        // .clipShape(Ellipse())
        
        /*
         .overlay(
         //RoundedRectangle(cornerRadius: 16)
         Ellipse()
         .stroke(Color.gray, lineWidth: 4)
         )
         */
        
        //  .shadow(radius: 10)
    }
}

/*struct BookmarkAddView_Previews: PreviewProvider {
 static var previews: some View {
 BookmarkAddView(isPresented: Binding<Bool>)
 }
 }*/
