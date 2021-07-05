//
//  InformationState.swift
//  abrowser
//
//  Created by 李兴利 on 2021/7/5.
//

import SwiftUI

class InformationState: ObservableObject {
    @Published var info = []
    
    func getInfomation(){
        // 构建URL
        let url:URL = URL(string: "https://www.fastmock.site/mock/d2de8e895441145915084a4f27791ac9/abrowser/infomation")!
        // 发送HTTP请求的的session对象
        let session = URLSession.shared
        // 构建请求request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        // 发一个get请求
        let task = session.dataTask(with: request as URLRequest) {(
            data, response, error) in
            
            guard let data = data, let _:URLResponse = response, error == nil else {
                print("error")
                return
            }
            let dataString =  String(data: data, encoding: String.Encoding.utf8)
            let dict = self.getDictionaryFromJSONString(jsonString: dataString!)
            print(dict)
            
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
