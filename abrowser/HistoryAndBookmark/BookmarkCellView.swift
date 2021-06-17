//
//  BookmarkCellView.swift
//  abrowser
//
//  Created by Apple on 2021/6/8.
//

import SwiftUI

struct BookmarkCellView : View{
    @ObservedObject var navigationState : NavigationState
    @ObservedObject var bookmarkState : BookmarkState
    @Binding var isPresented : Bool
    @Binding var isEditing : Bool
    @State var test = ""
    var data : [Bookmark]
    
    func deleteRow (at offsets:IndexSet){
        bookmarkState.data.remove(atOffsets: offsets)
    }
    
    var body: some View {
        VStack{
            List{
                ForEach(data){ item in
                    if(item.children != nil){
                        NavigationLink(destination: BookmarkCellView(navigationState: navigationState, bookmarkState: bookmarkState, isPresented: $isPresented, isEditing: $isEditing, data: item.children!)){
                            Text(item.description)
                                .lineLimit(1)
                        }
                    }
                    else{
                        Text(item.description)
                            .lineLimit(1)
                            .onTapGesture {
                                navigationState.navGoTo(addressInput: item.url)
                                isPresented = false
                            }
                    }
                }.onDelete(perform: deleteRow)
            }.environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive)).animation(Animation.spring())
            HStack{
                Button(action: {
                    // 添加
                }, label: {
                    Text("新建文件夹")
                })
                Spacer()
                
                Button(action: {
                    // 编辑
                    isEditing.toggle()
                }, label: {
                    Text("编辑")
                })
            }
            .padding(.horizontal)
            .padding(.top, 8)
            .padding(.bottom)
        }
        
    }
}

//struct BookmarkCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookmarkCellView(model: BookmarkCellView(model:BookmarkModel(title: "Item Title", subTitle: "Item SubTitle")).previewLayout(.fixed(width: 375, height: 60)) as! BookmarkModel
//        ) }
//}
