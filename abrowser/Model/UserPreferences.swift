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

    @Published var searchEngineType: Int = 0
    @Published var searchEngine: String = ""
    @Published var homePageType : Int = 0
    @Published var homePage: String = ""
    @Published var customPage: String = ""
    
    required init(mediator: Mediator){
        self.mediator = mediator
        super.init()
        // get data from local storage
        loadPreferencesFromLocal()
    }
    
    func setSearchEngineType(type: Int){
        self.searchEngineType = type
        changeSearchEngine()
    }
    
    func setHomePageType(type: Int){
        self.homePageType = type
        changeHomePage()
    }
    
    func changeSearchEngine(){
        switch(searchEngineType){
        case 0:
            //baidu
            searchEngine = "https://www.baidu.com/s?ie=UTF-8&wd="
        case 1:
            //sogou
            searchEngine = "https://www.sogou.com/web?query=321"
        case 2:
            //bing
            searchEngine = "https://cn.bing.com/search?q="
        default:
            //default
            searchEngine = "https://www.baidu.com/s?ie=UTF-8&wd="
        }
    }
    
    func changeHomePage(){
        switch(homePageType){
        case 0:
            // 新标签页
            homePage = "about:newtab"
        case 1:
            // 空白页
            homePage = "about:blank"
        case 2:
            // 自定义
            homePage = self.customPage
        default:
            // default
            homePage = "about:newtab"
        }
    }
    
    func setCustomPage(newURL:String){
        self.customPage = newURL
    }
    
    func loadPreferencesFromLocal(){
//        do{
//            let searchEngineTypeData = try JSONEncoder().encode(searchEngineType)
//            let searchEngineData = try JSONEncoder().encode(searchEngine)
//            let homePageTypeData = try JSONEncoder().encode(homePageType)
//            let homePageData = try JSONEncoder().encode(homePage)
//            let customPageData = try JSONEncoder().encode(customPage)
            self.searchEngineType = UserDefaults.standard.integer(forKey: "searchEngineType")
            self.searchEngine = UserDefaults.standard.string(forKey: "searchEngine") ?? "https://www.baidu.com/s?ie=UTF-8&wd="
            self.homePageType = UserDefaults.standard.integer(forKey: "homePageType")
            self.homePage = UserDefaults.standard.string(forKey: "homePage") ?? "about:newtab"
            self.customPage = UserDefaults.standard.string(forKey: "customPage") ?? "https://www.baidu.com"
//        }catch{
//            print(error)
//        }
    }
    
    func savePreferencesToLocal(){
//        do{
//            let searchEngineTypeData = try JSONEncoder().encode(searchEngineType)
//            let searchEngineData = try JSONEncoder().encode(searchEngine)
//            let homePageTypeData = try JSONEncoder().encode(homePageType)
//            let homePageData = try JSONEncoder().encode(homePage)
//            let customPageData = try JSONEncoder().encode(customPage)
            UserDefaults.standard.set(searchEngineType, forKey: "searchEngineType")
            UserDefaults.standard.set(searchEngine, forKey: "searchEngine")
            UserDefaults.standard.set(homePageType, forKey: "homePageType")
            UserDefaults.standard.set(homePage, forKey: "homePage")
            UserDefaults.standard.set(customPage, forKey: "customPage")
//        }catch{
//            print(error)
//        }
    }
}
