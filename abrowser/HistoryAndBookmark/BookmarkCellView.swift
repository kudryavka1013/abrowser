//
//  BookmarkCellView.swift
//  abrowser
//
//  Created by Apple on 2021/6/8.
//

import SwiftUI

struct BookmarkCellView : View{
    @ObservedObject var navigationState : NavigationState
    @Binding var isPresented : Bool
    var data : [Bookmark]
    
    func deleteRow (at offsets:IndexSet){
        print("删除");
    }
    
    var body: some View {
        List{
            ForEach(data){ item in
                if(item.children != nil){
                    NavigationLink(destination: BookmarkCellView(navigationState : navigationState, isPresented: $isPresented, data: item.children!)){
                        Text(item.description)
                    }
                }
                else{
                    Text(item.description)
                        .onTapGesture {
                            navigationState.navGoTo(addressInput: item.url)
                            isPresented = false
                        }
                }
            }.onDelete(perform: deleteRow)
        }
    }
}

//struct BookmarkCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookmarkCellView(model: BookmarkCellView(model:BookmarkModel(title: "Item Title", subTitle: "Item SubTitle")).previewLayout(.fixed(width: 375, height: 60)) as! BookmarkModel
//        ) }
//}
