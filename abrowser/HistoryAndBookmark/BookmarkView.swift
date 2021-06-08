//
//  BookmarkView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/4.
//

import SwiftUI

struct Bookmark: Identifiable,Hashable {
    var id = UUID()
    var name: String
}

struct BookmarkRow: View {
    var bookmark: Bookmark
    
    var body: some View {
        Text("\(bookmark.name)")
    }
}

struct BookmarkView: View {
    var body: some View {
        var model: ListModel
        var body: some View {
            HStack{
                VStack(alignment: .leading) { Text(verbatim: model.title); Text(verbatim: model.subTitle)
                }
                Spacer()
            }.padding() }
        

        func deleteRow(at offsets:IndexSet) {
            Bookmark.remove(atOffsets:offsets)
                }
                
                return List{
                    ForEach(Bookmark, id: \.self) { Bookmark in
                        BookmarkRow(bookmark: Bookmark)
                    }.onDelete(perform: deleteRow)
                }
        
    }
}

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView(model:ListModel(title: "Item Title", subTitle: "Item SubTitle")).previewLayout(.fixed(width: 375, height: 60)
    }
}
