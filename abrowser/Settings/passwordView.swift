//
//  passwordView.swift
//  abrowser
//
//  Created by YJY on 2021/6/28.
//

import SwiftUI

struct passwordView: View {
    
    @State var oldpassword : String = "123456"
    @State var password: String = ""
    @State var newpassword: String = ""
    @State var checkpassword: String = ""
    
    var body: some View {
        List {
            Section() {
                TextField("请输入原密码",text : $password)
            }
            
            Section(header: Text("新密码")) {
                TextField("新密码",text : $newpassword)
                TextField("重新输入密码",text : $checkpassword)
            }
            Section{
                HStack{
                    Spacer()
                    Button(action: {}, label: {
                        Text("提交")
                    })
                    Spacer()
                }.foregroundColor(Color.red)
            }
        }
        .navigationBarTitle(Text("更改密码"))
        .listStyle(GroupedListStyle())
    }
}

struct passwordView_Previews: PreviewProvider {
    static var previews: some View {
        passwordView()
    }
}
