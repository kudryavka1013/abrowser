//
//  HistoryState.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/4.
//

import SwiftUI
//url name list time

struct HistoryModel : Identifiable{
    var id = UUID()
    var websitename: String
    var websiteURL: String
    var responsetime : String
    
    init(websitename: String, websiteURL: String, responsetime: String) {
        self.websitename = websitename
        self.websiteURL = websiteURL
        self.responsetime = responsetime
    }
}

//本地历史数据
class HistoryState : NSObject , ObservableObject {
    var history : [HistoryModel] = [
        HistoryModel(websitename: "百度1", websiteURL: "https://www.baidu.com", responsetime: "20210617"),
        HistoryModel(websitename: "百度2", websiteURL: "https://www.baidu.com", responsetime: "20210617"),
        HistoryModel(websitename: "百度3", websiteURL: "https://www.baidu.com", responsetime: "20210617"),
        HistoryModel(websitename: "百度4", websiteURL: "https://www.baidu.com", responsetime: "20210616"),
        HistoryModel(websitename: "百度5", websiteURL: "https://www.baidu.com", responsetime: "20210616"),
        HistoryModel(websitename: "百度6", websiteURL: "https://www.baidu.com", responsetime: "20210616"),
        HistoryModel(websitename: "百度7", websiteURL: "https://www.baidu.com", responsetime: "20210615"),
        HistoryModel(websitename: "百度8", websiteURL: "https://www.baidu.com", responsetime: "20210615"),
        HistoryModel(websitename: "百度9", websiteURL: "https://www.baidu.com", responsetime: "20210615")
    ]
    
    @Published var historytoday : [HistoryModel] = []
    @Published var historyyesterday : [HistoryModel] = []
    @Published var historyago : [HistoryModel] = []

    //解档
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
                historytoday.append(item)
            }else if (date as NSString).integerValue - (item.responsetime as NSString).integerValue == 1 {
                historyyesterday.append(item)
            }else {
                historyago.append(item)
            }
        }
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
    
    override init() {
        super.init()
        // jiedang
        self.date = currentTime()
        self.classification()

    }
}


//解档归档
// 分类
// 删除一条
//删除一类
//跳转
