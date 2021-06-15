//
//  BookmarkState.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/4.
//
import SwiftUI

class BookmarkState : NSObject, ObservableObject{
   
    func addBookmark(name: String , url: String){
        //
    }
    
    
}

/* struct Bookmark:Identifiable, Hashable {
    var id = UUID()
    var name = ""
    var url = ""
    var children: [Bookmark]? = nil
    var description: String {
        switch children {
        case nil:
            return "🔖 \(name)"
        case .some(let children):
            return children.isEmpty ? "📂 \(name)" : "📁 \(name)"
        }
    }
}*/
