//
//  userImformationView.swift
//  abrowser
//
//  Created by YJY on 2021/6/28.
//

import SwiftUI

struct userImformationView: View {
    @State private var name: String = ""
    @State private var phone: String = ""
    @State private var email: String = ""
    
    var body: some View {
        List {
            Section(header: Text("账号")) {
                TextField("用户名",text:$name)
                
            }
            Section(header: Text("联络方式")) {
                TextField("电话",text:$phone)
                TextField("邮箱",text:$email)
            }
        }
        .navigationBarTitle(Text("姓名·电话·邮箱"))
        .listStyle(GroupedListStyle())
    }
}


struct userImformationView_Previews: PreviewProvider {
    static var previews: some View {
        userImformationView()
    }
}
