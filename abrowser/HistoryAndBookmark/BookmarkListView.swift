//
//  BookmarkListView.swift
//  abrowser
//
//  Created by Apple on 2021/6/8.
//

import SwiftUI

struct BookmarkListView : View{
    @ObservedObject var navigationState : NavigationState
    @ObservedObject var bookmarkState : BookmarkState
    @Binding var isPresented : Bool
    @Binding var isEditing : Bool
    @State var bookmarkList : [Bookmark]
    @State private var showAlert = false
    @State private var showEditButton = false
    @State private var EditViewIsPresented = false
    @State var text = ""
    
    func deleteRow(at offsets:IndexSet){
        bookmarkList.remove(atOffsets: offsets)
    }
    
    var body: some View {
        ZStack{
            VStack{
                List{
                    ForEach(bookmarkList){ item in
                        HStack{
                            Button(action: {
                                navigationState.navGoTo(addressInput: item.url)
                                isPresented = false
                            }, label: {
                                Text(item.name)
                                    .lineLimit(1)
                            })
                            .buttonStyle(BorderlessButtonStyle())
                            .accentColor(.black)
                            Spacer()
                            Button(action: {
                                EditViewIsPresented = true
                            }, label: {
                                Image(systemName:"info.circle")
                            }).sheet(isPresented: $EditViewIsPresented, content: {
                                BookmarkEditView(bookmarkState: bookmarkState, EditViewIsPresented: $EditViewIsPresented,item: item)
                            })
                            .opacity(showEditButton ? 1 : 0)
                            .buttonStyle(BorderlessButtonStyle())
                            .accentColor(.black)
                        }
                    }.onDelete(perform: deleteRow)
                }.environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive)).animation(Animation.spring())
                
                HStack{
                    Button(action: {
                        self.showAlert.toggle()
                    }, label: {
                        Text("新建文件夹")
                    }).disabled(true) //已禁用
                    Spacer()
                    
                    Button(action: {
                        self.showEditButton.toggle()
                        isEditing.toggle()
                    }, label: {
                        Text("编辑")
                    })
                }
                .padding(.horizontal)
                .padding(.top, 8)
                .padding(.bottom)
            }.blur(radius: showAlert ? 16 : 0)
            .animation(.easeIn(duration: 0.1))
            
            BookmarkAddView(bookmarkState: bookmarkState, isPresented: $showAlert)
                .opacity(showAlert ? 1 : 0)
                .animation(.easeIn(duration: 0.1))
            
        }
    }
}


//struct BookmarkCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookmarkCellView(model: BookmarkCellView(model:BookmarkModel(title: "Item Title", subTitle: "Item SubTitle")).previewLayout(.fixed(width: 375, height: 60)) as! BookmarkModel
//        ) }
//}
