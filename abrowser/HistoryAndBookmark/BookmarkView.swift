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

struct ListModel {
    var title: String;
    var subTitle: String;
    
    init(title: String, subTitle: String) {
        self.title = title;
        self.subTitle = subTitle
    }
}

struct BookmarkView: View {
    var dataSource = (0..<5).map({ListModel(title: "Item \($0)", subTitle: "Sub \($0)")})
        
        var body: some View {
        List(dataSource.identified(by: \.title)) { model in BookmarkCellView(model: model) }.padding()

/*        func deleteRow(at offsets:IndexSet) {
            Bookmark.remove(atOffsets:offsets)
                }
                
                return List{
                    ForEach(Bookmark, id: \.self) { Bookmark in
                        BookmarkRow(bookmark: Bookmark)
                    }.onDelete(perform: deleteRow)
                } */
    }
}

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView()
    }
}

