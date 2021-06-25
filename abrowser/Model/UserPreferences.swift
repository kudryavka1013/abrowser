//
//  UserPreferences.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/21.
//

import SwiftUI

protocol UserPreferencesProtocol: AnyObject {
    var mediator: Mediator { get }
}
class UserPreferences: NSObject, ObservableObject,UserPreferencesProtocol{
    var mediator : Mediator
    
    @Published var searchEngineType: Int
    @Published var searchEngine: String
    @Published var homePageType : Int
    @Published var homePage: String

    required init(mediator: Mediator) {
        self.mediator = mediator
//        super.init()
        // get data from local storage
        searchEngineType = 0
        searchEngine = "https://cn.bing.com/search?q="
        homePageType = 0
        homePage = "abc"
    }
    
    func changeEngine(){
        switch(searchEngineType){
        case 0:
            searchEngine = "https://cn.bing.com/search?q="
        default:
            searchEngine = "https://cn.bing.com/search?q="
        }
    }
    
    func changeHomePage(){
        switch(homePageType){
        case 0:
            homePage = "https://www.baidu.com"
        default:
            homePage = "https://www.baidu.com"
        }
    }
}
