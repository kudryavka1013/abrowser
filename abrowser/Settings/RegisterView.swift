//
//  RegisterView.swift
//  abrowser
//
//  Created by YJY on 2021/6/23.
//

import SwiftUI

struct RegisterView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
//        List {
            Form {
                Section(header: Text("账号")) {
                    TextField("用户名",text:self.$name)
                    TextField("邮箱",text:$email)
                }
                Section(header: Text("密码")) {
                    TextField("密码",text:self.$password)
                    TextField("再次输入密码",text:self.$password)
                }
                Section {
                    Button(action: {
                                print("register account")
                            }) {
                                Text("提交")
                            }
                }
            }
//            .navigationBarTitle(Text("注册"))
//        }
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
