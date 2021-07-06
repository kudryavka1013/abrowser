//
//  InformationState.swift
//  abrowser
//
//  Created by 李兴利 on 2021/7/5.
//

import SwiftUI


struct InfoItem : Codable,Identifiable{
    var id = UUID()
    
    var title: String
    var url: String
    var image: String
    var createdate: String
    var source: String
    
    private enum CodingKeys : String, CodingKey { case title, url, image,createdate,source }
    
    init(title: String, url: String, image: String,createdate:String,source:String) {
        self.title = title
        self.url = url
        self.image = image
        self.createdate = createdate
        self.source = source
    }
}

class InformationState: ObservableObject {
    @Published var info : [InfoItem] = []
    
    init(){
        self.getInfomation()
    }
    
    func getInfomation(){
        // 构建URL
        let url:URL = URL(string: "https://www.fastmock.site/mock/d2de8e895441145915084a4f27791ac9/abrowser/infomation")!
        //        let url = URL(string: "https://www.fastmock.site/mock/d2de8e895441145915084a4f27791ac9/abrowser/test")!
        // 发送HTTP请求的的session对象
        let session = URLSession.shared
        // 构建请求request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        // 发一个get请求
        let task = session.dataTask(with: request as URLRequest) {(
            data, response, error) in
            
            if let data = data {
                //                let dataString = String(data: data, encoding: String.Encoding.utf8)
                //    print(dataString)
                if let decodedResponse = try? JSONDecoder().decode([InfoItem].self, from: data) {
                    // 我们得到了有用的数据 - 返回到主线程
                    DispatchQueue.main.async {
                        // 更新
                        self.info = decodedResponse
                        print(self.info)
                    }
                    // 所有工作都完成了，所以可以退出了
                    return
                }
                print("decodedresponse error")
            }
            //            if let decodedResponse = try? JSONDecoder().decode(, from: data)
            //            let dict = self.getDictionaryFromJSONString(jsonString: dataString!)
            //            print(dict)
            
            //            print(dataString)
            
            //            let jsonData = dataString.data(using: String.Encoding.utf8, allowLossyConversion: false)
            //            let json = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
            //            print()
            
        }
        task.resume()
    }
    
    func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{
        let jsonData:Data = jsonString.data(using: .utf8)!
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
    }
}
