//
//  BookmarkState.swift
//  abrowser
//
//  Created by ζε΄ε© on 2021/6/4.
//
import SwiftUI

struct Bookmark: Identifiable, Hashable, Codable{
    var id = UUID()
    var name = ""
    var url = ""
//    var children: [Bookmark]? = nil
//    var description: String {
//        switch children {
//        case nil:
//            return "π \(name)"
//        case .some(let children):
//            return children.isEmpty ? "π \(name)" : "π \(name)"
//        }
//    }
}

struct Folder: Identifiable{
    var id = UUID()
    var name = ""
    var bookmarks : [Bookmark]
}

protocol BookmarkProtocol : AnyObject{
    var mediator : Mediator { get }
    
}
class BookmarkState : NSObject, ObservableObject,BookmarkProtocol{
    var mediator : Mediator
    
    required init(mediator: Mediator){
        self.mediator = mediator
        super.init()
        //θ§£ζ‘£
        self.getBookmarkFromLocal()
    }

    @Published var bookmarkList:[Bookmark] = []
    
    func addBookmark(name: String, url: String){
        let add_bm = Bookmark(name: name == "" ? url : name , url: url)
        bookmarkList.append(add_bm)
    }
    
    func editBookmark(name: String, url: String,item: Bookmark){
        let editItem = Bookmark(name: name, url: url)
        let i = bookmarkList.firstIndex(of: item)
        bookmarkList[i!] = editItem
    }
//    func addFolder(name: String){
//        let folder = Folder(name: name, bookmarks: [])
//        bookmarkList.append(folder)
//    }
    
    func saveBookmarkToLocal(){
        do{
            let tempData = try JSONEncoder().encode(bookmarkList)
            UserDefaults.standard.set(tempData, forKey: "bookmark")
            //ε­ε₯ζ¬ε°
        }catch{
            print(error)
        }
    }
    
    func getBookmarkFromLocal(){
        do{
            let tempdata = UserDefaults.standard.data(forKey: "bookmark")
            //DataεεΊ
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
    
    

    
}
