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
    @State var data : [Bookmark]
    @State private var showAlert = false
    @State var text = ""
    
    func deleteRow(at offsets:IndexSet){
        print(offsets.count)
        data.remove(atOffsets: offsets)
        //        print(offsets.first)
        //        offsets.in
    }
    
    var body: some View {
        ZStack{
            VStack{
                List{
                    ForEach(data){ item in
                        if(item.children != nil){
                            NavigationLink(destination: BookmarkListView(navigationState: navigationState, bookmarkState: bookmarkState, isPresented: $isPresented, isEditing: $isEditing,  data: item.children!)){
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
                        self.showAlert.toggle()
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
            }.blur(radius: showAlert ? 16 : 0)
            .animation(.easeIn(duration: 0.1))
            
            BookmarkAddView(bookmarkState: bookmarkState, isPresented: $showAlert)
                .opacity(showAlert ? 1 : 0)
                .animation(.easeIn(duration: 0.1))
        
        }
    }
}

//extension View {
//    func showAlert(isPresented: Binding<Bool>) -> some View {
//        self.modifier (TextAlertVM (bookmarkState: bookmarkState, isPresented: isPresented))
//    }
//}

struct TextAlertVM: ViewModifier {
    @ObservedObject var bookmarkState : BookmarkState
    @Binding var isPresented: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .disabled(self.isPresented)
                .blur(radius: self.isPresented ? 6 : 0)
            if isPresented {
                BookmarkAddView(bookmarkState: bookmarkState, isPresented: $isPresented)
                    
                    .zIndex(1)
            }
        }
        
    }
}


//struct BookmarkCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookmarkCellView(model: BookmarkCellView(model:BookmarkModel(title: "Item Title", subTitle: "Item SubTitle")).previewLayout(.fixed(width: 375, height: 60)) as! BookmarkModel
//        ) }
//}
