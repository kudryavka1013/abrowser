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
    
    @Published var bookmarkList:[Bookmark] = []
    
    
    func addBookmark(name: String, url: String){
        let bm = Bookmark(name: name == "" ? url : name , url: url, children: nil)
        bookmarkList.append(bm)
    }
    
    func addFolder(name: String){
        let folder = Bookmark(name: name, children:[])
        bookmarkList.append(folder)
    }
    
    func saveBookmarkToLocal(){
        do{
            let tempData = try JSONEncoder().encode(bookmarkList)
            UserDefaults.standard.set(tempData, forKey: "bookmark")
            //存入本地
        }catch{
            print(error)
        }
    }
    
    func getBookmarkFromLocal(){
        do{
            let tempdata = UserDefaults.standard.data(forKey: "bookmark")
            //Data取出
            if(tempdata != nil){
                let tempArray = try JSONDecoder().decode([Bookmark].self, from: tempdata!)
                bookmarkList = tempArray
            }else{
                bookmarkList = []
            }
           
        }catch{
            print(error)
        }
    }
    
    override init(){
        super.init()
        //解档
        self.getBookmarkFromLocal()
    }
    

    
}
