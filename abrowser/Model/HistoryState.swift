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

func currentTime() -> String {
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = "YYYYMMdd"// 自定义时间格式
    // GMT时间 转字符串，直接是系统当前时间
    return dateformatter.string(from: Date())
}

//本地历史数据
class HistoryState : NSObject , ObservableObject {
    @Published var history : [HistoryModel] = [
        HistoryModel(websitename: "百度", websiteURL: "https://www.baidu.com", responsetime: "20210617"),
        HistoryModel(websitename: "百度", websiteURL: "https://www.baidu.com", responsetime: "20210617"),
        HistoryModel(websitename: "百度", websiteURL: "https://www.baidu.com", responsetime: "20210617"),
        HistoryModel(websitename: "百度", websiteURL: "https://www.baidu.com", responsetime: "20210617"),
        HistoryModel(websitename: "百度", websiteURL: "https://www.baidu.com", responsetime: "20210617"),
        HistoryModel(websitename: "百度", websiteURL: "https://www.baidu.com", responsetime: "20210617"),
        HistoryModel(websitename: "百度", websiteURL: "https://www.baidu.com", responsetime: "20210617"),
        HistoryModel(websitename: "百度", websiteURL: "https://www.baidu.com", responsetime: "20210617"),
        HistoryModel(websitename: "百度", websiteURL: "https://www.baidu.com", responsetime: "20210617")
    ]
    @Published var historytoday : [HistoryModel] = []
    @Published var historyesterday : [HistoryModel] = []
    
    //解档
    var date = currentTime()
    
//    foreach history {
//        if date == history[i].responsetime {
//            historytoday[] = history[
//        }
//    }
}
