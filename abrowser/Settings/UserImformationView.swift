//
//  UserImformationView.swift
//  abrowser
//
//  Created by YJY on 2021/6/28.
//

import SwiftUI

struct UserImformationView: View {
    @State private var name: String = ""
    @State private var phone: String = ""
    @State private var email: String = ""
    
    @ObservedObject var userState : UserState
    
    var body: some View {
        List {
            Section(header: Text("账号")) {
                TextField(userState.username,text:$name)
                
            }
            Section(header: Text("联络方式")) {
                TextField(userState.phonenumber,text:$phone)
                TextField(userState.useremail,text:$email)
            }
        }
        .navigationBarTitle(Text("姓名·电话·邮箱"))
        .listStyle(GroupedListStyle())
    }
}

//
//struct UserImformationView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserImformationView()
//    }
//}
