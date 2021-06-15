//
//  BookmarkView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/4.
//

import SwiftUI
//struct DestinationPageView: View {
//    var color: Color
//    var body: some View {
//        Text("Destination Page")
//            .font(.title)
//            .foregroundColor(color)
//    }
//}





struct BookmarkView: View {
    @ObservedObject var navigationState : NavigationState
    @Binding var isPresented : Bool
//    @Binding var data : []
    
    @State var item = [
        Bookmark(name: "文件夹1",children: [
            Bookmark(name: "书签1",url: "https://www.baidu.com",children: nil),
            Bookmark(name: "书签2",url: "https://www.baidu.com",children: nil),
            Bookmark(name: "书签3",url: "https://www.baidu.com",children: nil)
        ]),
        Bookmark(name: "文件夹2",children: [
            Bookmark(name: "文件夹3",children: [
                Bookmark(name: "书签7",url: "https://www.baidu.com",children: nil),
                Bookmark(name: "书签8",url: "https://www.baidu.com",children: nil),
                Bookmark(name: "书签9",url: "https://www.baidu.com",children: nil)
            ]),
            Bookmark(name: "书签4",url: "https://www.baidu.com",children: nil),
            Bookmark(name: "文件夹4",children: [])
        ]),
        Bookmark(name: "书签5",url: "https://www.baidu.com",children: nil)
    ]
    
    var body: some View {
        NavigationView{
            BookmarkCellView(navigationState : navigationState, isPresented: $isPresented, data: item)
            
        }
    }
}



//struct BookmarkView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookmarkView()
//    }
//}
