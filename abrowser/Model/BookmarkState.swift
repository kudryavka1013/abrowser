//
//  BookmarkState.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/4.
//
import SwiftUI

struct Bookmark: Identifiable, Hashable, Codable{
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
}

class BookmarkState : NSObject, ObservableObject{
//    static var supportsSecureCoding: Bool {
//        return true
//    }
    
   @Published var data = [
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
    
//    func encode(with coder: NSCoder) {
////        coder.encode(Bookmark(), forKey: "Bookmark")
//        coder.encode(url, forKey: "url")
//        coder.encode(<#T##object: Any?##Any?#>)
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init()
//        name = coder.decodeObject(forKey: "name") as? String ?? ""
//        Bookmark = coder.decodeObject(forKey: "Bookmark") as! BookmarkState.Bookmark.Type 
//    }
    
    func addBookmark(name: String, url: String){
        let bm = Bookmark(name: name == "" ? url : name , url: url, children: nil)
        data.append(bm)
    }
    
    func addFolder(name: String){
        let folder = Bookmark(name: name, children:[])
        data.append(folder)
    }
    
//    @objc func storeComplexDataAction() {
//        let bm1 = Bookmark(name: "百度", url: "https://www.baidu.com", children: nil)
////        DXCacheManager.sharedInstance.setObject(Bookmark, forKey: BookmarkModelKey)
//    }
    
}



