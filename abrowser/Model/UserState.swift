//
//  UserState.swift
//  abrowser
//
//  Created by YJY on 2021/7/1.
//

import SwiftUI
//
//struct Response: Codable {
//    var results: [Result]
//}

struct Result: Codable {
    var username: String
    var phonenumber: String
    var useremail: String
    var userpassword : String
    var issuccess : Bool
}

struct postdata: Codable {
    var username: String
    var phonenumber: String
    var userpassword : String
}

struct responsedata: Codable {
    var issuccess: Bool
}

class UserState : NSObject, ObservableObject {
    
    @Published var isLogin: Bool = false
    @Published var isRegister: Bool = false
    @Published var username: String = ""
    @Published var phonenumber: String  = ""
    @Published var useremail: String  = ""
    @Published var userpassword: String = ""
    
//    @State private var results = [Result]()
    
    func Login() {
        guard let url = URL(string: "https://www.fastmock.site/mock/d2de8e895441145915084a4f27791ac9/abrowser/userAccount") else {
            print("Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
//                print(data)
                if let decodedResponse = try? JSONDecoder().decode(Result.self, from: data) {
                    print(decodedResponse)
                    DispatchQueue.main.async {
                        self.username = decodedResponse.username
                        self.phonenumber = decodedResponse.phonenumber
                        self.useremail = decodedResponse.useremail
                        self.userpassword = decodedResponse.userpassword
                        self.isLogin = decodedResponse.issuccess
//                        self.results = decodedResponse.results
//                        print(self.results)
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
        
    }
    
    
    func Register(username: String, phonenumber: String, userpassword: String) {
        
        let dataTopost = postdata(username: username, phonenumber: phonenumber, userpassword: userpassword)
        
        guard let encodeddata = try? JSONEncoder().encode(dataTopost) else {
            print("Failed")
            return
        }
        print(encodeddata)
        
        guard let url = URL(string: "https://www.fastmock.site/mock/d2de8e895441145915084a4f27791ac9/abrowser/register") else {
            print("Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encodeddata
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
//                print(data)
                if let decodedResponse = try? JSONDecoder().decode(responsedata.self, from: data) {
                    print(decodedResponse)
//                    DispatchQueue.main.async {
//                        self.username = decodedResponse.username
//                        self.phonenumber = decodedResponse.phonenumber
//                        self.useremail = decodedResponse.useremail
//                        self.userpassword = decodedResponse.userpassword
                        self.isRegister = decodedResponse.issuccess
////                        self.results = decodedResponse.results
//                        print(self.results)
//                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()

    }
    
}
