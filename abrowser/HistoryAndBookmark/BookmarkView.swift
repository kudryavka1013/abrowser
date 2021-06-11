//
//  BookmarkView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/4.
//

import SwiftUI

struct DestinationPageView: View {
    var color: Color
    var body: some View {
        Text("Destination Page")
            .font(.title)
            .foregroundColor(color)
    }
}
struct Bookmark:Identifiable, Hashable {
    var id = UUID()
    var name = ""
    var children: [Bookmark]? = nil
    var description: String {
        switch children {
        case nil:
            return "🔖 \(name)"
        case .some(let children):
            return children.isEmpty ? "📂 \(name)" : "📁 \(name)"
        }
    }
}

struct BookmarkView: View {
    //    @ObservedObject var navigationState : NavigationState
    
    var item = [
        Bookmark(name: "文件夹1",children: [
            Bookmark(name: "书签1",children: nil),
            Bookmark(name: "书签2",children: nil),
            Bookmark(name: "书签3",children: nil)
        ]),
        Bookmark(name: "文件夹2",children: [
            Bookmark(name: "文件夹3",children: [
                Bookmark(name: "书签7",children: nil),
                Bookmark(name: "书签8",children: nil),
                Bookmark(name: "书签9",children: nil)
            ]),
            Bookmark(name: "书签4",children: nil),
            Bookmark(name: "文件夹4",children: [])
        ]),
        Bookmark(name: "书签5",children: nil)
    ]
    
    var body: some View {
        
        NavigationView{
            BookmarkCellView(data: item)
        }
    }
}

struct BookmarkCellView : View{
    var data : [Bookmark]
    
    func deleteRow (at offsets:IndexSet){
        print("删除");
    }
    
    var body: some View {
        
        List{
            ForEach(data){ item in
                if(item.children != nil){
                    NavigationLink(destination: BookmarkCellView(data: item.children!)){
                        Text(item.description)
                    }
                }
                else{
                    Text(item.description)
                }
            }.onDelete(perform: deleteRow)
        }
    }
}

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView()
    }
}
