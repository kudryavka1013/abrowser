//
//  HistoryState.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/4.
//

import SwiftUI
//url name list time

struct HistoryModel : Identifiable, Hashable, Codable{
    let id = UUID()
    let websitename: String
    let websiteURL: String
    let responsetime : String
    
    private enum CodingKeys : String, CodingKey { case websitename, websiteURL, responsetime }
    
    init(websitename: String, websiteURL: String, responsetime: String) {
        self.websitename = websitename
        self.websiteURL = websiteURL
        self.responsetime = responsetime
    }
}

protocol HistoryProtocol : AnyObject{
    var mediator : Mediator { get }
    
    func addhistory(newtitle : String,newUrl : String)
}

//本地历史数据
class HistoryState : NSObject ,ObservableObject ,HistoryProtocol{
    var mediator: Mediator
    
    required init(mediator: Mediator) {
        self.mediator = mediator
        super.init()
        // jiedang
        self.date = currentTime()
        self.getHistoryFromLocal()
        self.classification()
    }
    
    @Published var history : [HistoryModel] = []
    @Published var historytoday : [HistoryModel] = []
    @Published var historyyesterday : [HistoryModel] = []
    @Published var historyago : [HistoryModel] = []

    //存储
    func saveHistoryToLocal(){
        history.removeAll()
        for item in historyago{
            history.append(item)
        }
        for item in historyyesterday{
            history.append(item)
        }
        for item in historytoday{
            history.append(item)
        }
        do{
            let tempData = try JSONEncoder().encode(history)  //history 包装Data
           // print(tempData)
            UserDefaults.standard.set(tempData, forKey: "history")//存入本地
        }catch{
            print(error)
        }
    }
    
    //从本地取出history
    func getHistoryFromLocal(){
        do{
            let tempdata = UserDefaults.standard.data(forKey: "history") //Data取出
            if(tempdata != nil){
                let tempArray = try JSONDecoder().decode([HistoryModel].self, from: tempdata!)
                history = tempArray
            }else{
                history = []
            }

        }catch{
            print(error)
        }
    }
    
    func currentTime() -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "YYYYMMdd"// 自定义时间格式
        // GMT时间 转字符串，直接是系统当前时间
        return dateformatter.string(from: Date())
    }
    
    var date : String = ""
    //history分类 今天 昨天 之前
    func classification(){
        print("classification")
        for item in history{
            if date == item.responsetime{
                historytoday.insert(item, at: 0)
            }else if (date as NSString).integerValue - (item.responsetime as NSString).integerValue == 1 {
                historyyesterday.insert(item, at: 0)
            }else {
                historyago.insert(item, at: 0)
            }
        }
    }
    
    func addhistory(newtitle : String,newUrl : String) {
        print("historystate addhistory")
        let newresponse = currentTime()
        let item = HistoryModel(websitename: newtitle, websiteURL: newUrl, responsetime: newresponse)
        //historytoday.append(item)
        historytoday.insert(item, at: 0)
    }
    
    func deleteAllHistory(){
        historytoday.removeAll()
        historyyesterday.removeAll()
        historyago.removeAll()
    }
    
    func deleteTodayHistory(){
        historytoday.removeAll()
    }
    
    func deleteTodayandYesterdayHistory(){
        historytoday.removeAll()
        historyyesterday.removeAll()
    }
    
//    override init() {
//        super.init()
//        // jiedang
//        self.date = currentTime()
//        self.getHistoryFromLocal()
//        self.classification()
//
//    }
}


//解档归档
// 分类
// 删除一条
//删除一类
//跳转
