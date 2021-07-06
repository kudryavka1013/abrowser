//
//  accountView.swift
//  abrowser
//
//  Created by YJY on 2021/6/28.
//

import SwiftUI

struct AccountView: View {
    
    @ObservedObject var userState : UserState
    
    
    @Binding var selectIsPresented : Bool
    @State var name: String = ""
    @State var password: String = ""
    @State var email: String = ""
    
    var body: some View{
        List {
            HStack (alignment: .center) {
                Spacer()
                VStack (alignment: .center) {
                    Spacer().frame(width: 100, height: 30)
                    Image("登录成功2").frame(width: 100, height: 100)
                    Text(userState.username).font(.title).offset(y : 3)
                    Spacer().frame(width: 100, height: 30)
                }
                Spacer()
            }
            Section{
                NavigationLink (destination:UserImformationView(userState: userState)){
                    Text("姓名·电话·邮箱")
                }
                NavigationLink (destination:PasswordView()){
                    Text("更改密码")
                }
            }
            Section{
                HStack{
                    Spacer()
                    Button(action: { userState.isLogin=false ; selectIsPresented = false}, label: {
                        Text("退出登录")
                    })
                    Spacer()
                }.foregroundColor(Color.red)
            }
        }.navigationBarTitle(Text("用户管理"),displayMode: .inline)
        
        .listStyle(GroupedListStyle())
    }
}
//
//struct AccountView_Previews: PreviewProvider {
//    static var previews: some View {
//        AccountView()
//    }
//}
