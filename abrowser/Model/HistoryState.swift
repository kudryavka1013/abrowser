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

//本地历史数据
class HistoryState : NSObject , ObservableObject {
    @Published var history : [HistoryModel] = [
        HistoryModel(websitename: "百度B", websiteURL: "https://www.baidu.com", responsetime: "20210618"),
        HistoryModel(websitename: "百度b", websiteURL: "https://www.baidu.com", responsetime: "20210618"),
        HistoryModel(websitename: "百度1", websiteURL: "https://www.baidu.com", responsetime: "20210617"),
        HistoryModel(websitename: "百度2", websiteURL: "https://www.baidu.com", responsetime: "20210617"),
        HistoryModel(websitename: "百度3", websiteURL: "https://www.baidu.com", responsetime: "20210617"),
        HistoryModel(websitename: "百度4", websiteURL: "https://www.baidu.com", responsetime: "20210616"),
        HistoryModel(websitename: "百度5", websiteURL: "https://www.baidu.com", responsetime: "20210616"),
        HistoryModel(websitename: "百度6", websiteURL: "https://www.baidu.com", responsetime: "20210616"),
        HistoryModel(websitename: "百度7", websiteURL: "https://www.baidu.com", responsetime: "20210615"),
        HistoryModel(websitename: "百度8", websiteURL: "https://www.baidu.com", responsetime: "20210615"),
        HistoryModel(websitename: "百度7", websiteURL: "https://www.baidu.com", responsetime: "20210615"),
        HistoryModel(websitename: "百度8", websiteURL: "https://www.baidu.com", responsetime: "20210615"),
        HistoryModel(websitename: "百度9", websiteURL: "https://www.baidu.com", responsetime: "20210615"),
        HistoryModel(websitename: "百度7", websiteURL: "https://www.baidu.com", responsetime: "20210615"),
        HistoryModel(websitename: "百度8", websiteURL: "https://www.baidu.com", responsetime: "20210615"),
    ]
    
    @Published var historytoday : [HistoryModel] = []
    @Published var historyyesterday : [HistoryModel] = []
    @Published var historyago : [HistoryModel] = []

    //存储
    func localS(){
        let jsonString =
        """
        [{
            "websitename": "小明",
            "websiteURL": "www.abc.com",
            "responsetime": "43.2"
        },{
            "websitename": "小明",
            "websiteURL": "www.abc.com",
            "responsetime": "43.2"
        }]
        """
        do{
//            let tempDataGet = try JSONDecoder().decode([HistoryModel].self, from: jsonString.data(using: .utf8)!)
//            print(tempDataGet)
//
            
            let tempData = try JSONEncoder().encode(history)
            print(tempData)
            UserDefaults.standard.set(tempData, forKey: "history")
        }catch{
            print(error)
        }
        
//        var array = [
//            HistoryModel(websitename: "test", websiteURL: "test.com", responsetime: "20210617"),
//            HistoryModel(websitename: "test2", websiteURL: "test2.com", responsetime: "20210617")
//        ]
//                userDefault.set(array, forKey: "Array")
//                array = userDefault.array(forKey: "Array") as! [HistoryModel]
//                print(array)
    }
    
    func localG(){
        do{
            let tempdata = UserDefaults.standard.data(forKey: "history")
//            let jsonString = String.init(data: tempdata!, encoding: String.Encoding.utf8)
            let tempDataGet = try JSONDecoder().decode([HistoryModel].self, from: tempdata!)
            print(tempDataGet)
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
