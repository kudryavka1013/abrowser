//
//  Mediator.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/23.
//

import SwiftUI

final class Mediator{
    weak var navigationState : NavigationProtocol?
    weak var bookmarkState : BookmarkProtocol?
    weak var historyState : HistoryProtocol?
    weak var userPreferences : UserPreferencesProtocol?
    
    func setNav(_ nav : NavigationProtocol){
        navigationState = nav
    }
    func setHis(_ his: HistoryProtocol){
        historyState = his
    }
    func setPref(_ pref : UserPreferencesProtocol){
        userPreferences = pref
    }
    func setBook(_ book: BookmarkProtocol){
        bookmarkState = book
    }
    
    func addHistory(title: String,url: String){
        print("mediator addhistory")
        if(historyState == nil){print("historyState is nil")}
        historyState?.addhistory(newtitle: title, newUrl: url)
    }
}
