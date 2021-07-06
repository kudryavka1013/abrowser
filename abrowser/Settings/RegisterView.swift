//
//  RegisterView.swift
//  abrowser
//
//  Created by YJY on 2021/6/23.
//

import SwiftUI

class TextBindingManager: ObservableObject {
    @Published var text = "" {
        didSet {
            if text.count > characterLimit && oldValue.count <= characterLimit {
                text = oldValue
            }
        }
    }
    let characterLimit: Int

    init(limit: Int = 15){
        characterLimit = limit
    }
}

struct RegisterView: View {
    
    @ObservedObject var userState : UserState
    @Binding var viewSelected : Int
    
    @State private var isDispaly: Bool = false
    @State private var username: String = ""
    @State private var phonenumber: String = ""
//    @ObservedObject var password1 = TextBindingManager(limit: 15)
//    @ObservedObject var password2 = TextBindingManager(limit: 15)
    @State private var userpassword1: String = ""
    @State private var userpassword2: String = ""
    
    var body: some View {
        VStack {
            Spacer().frame(width: 100, height: 20)
            VStack {
                
    //                Text("Login")
    //                    .font(.title)
    //                    .fontWeight(.bold)
    //                    .foregroundColor(.black)
    //
    //
                VStack {
                    TextField("请输入账号", text: $phonenumber)
                        .frame(width: 350, height: 40, alignment: .center)
                           // .background(Color.white)
                    Divider()
                        .frame(width: 350)
                        .background(Color.gray)
                }
                .padding(.vertical)
                
                VStack {
                    TextField("请输入用户名", text: $username)
                        .frame(width: 350, height: 40, alignment: .center)
                           // .background(Color.white)
                    Divider()
                        .frame(width: 350)
                        .background(Color.gray)
                }
                .padding(.vertical)
                
                VStack {
                    HStack {
                            if isDispaly {
                                TextField("请输入密码", text: $userpassword1)
                            }
                            else {
                                SecureField("请输入密码", text: $userpassword1)
                            }
                        Button(action: {
                            isDispaly = !isDispaly
                        }) {
                            Image(systemName: self.isDispaly ? "eye.slash" : "eye")
                                .accentColor(.gray)
                        }
                    }
                        .frame(width: 350, height: 40, alignment: .center)
                          //  .background(Color.white)
                    Divider()
                        .frame(width: 350)
                        .background(Color.gray)
                }
                .padding(.vertical)
                    
                VStack {
                    SecureField("请再次输入密码", text: $userpassword2)
                        .frame(width: 350, height: 40, alignment: .center)
                           // .background(Color.white)
                    Divider()
                        .frame(width: 350)
                        .background(Color.gray)
                }
                .padding(.vertical)
                
                Spacer().frame(width: 100, height: 60)
                    
                Button(action: { userState.Register(username: username, phonenumber: phonenumber, userpassword: userpassword1)
                        }) {
                    Text("注册")
                        .fontWeight(.bold)
                        .bold()
                        .foregroundColor(.white)
                }
                .disabled(userpassword1 != userpassword2)
                .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                        .background(Color.blue)
                        .cornerRadius(22)

            }
                .onTapGesture {
                    print("tap")
                    self.hideKeyboard()
                }
                .padding()
                    //.background(Color.white)
                    //.cornerRadius(20)
                    //.padding()
            Spacer()
        }.alert(isPresented: $userState.isRegister, content: {
            Alert(title: Text("提示"), message: Text("注册成功"),dismissButton: Alert.Button.default(Text("确定"), action: {
                viewSelected = 1
            }))
        })
        .onAppear{
            userState.isRegister = false
        }
    }
}

//        List {
//            Form {
//                Section(header: Text("账号")) {
//                    TextField("用户名",text:self.$name)
//                    TextField("邮箱",text:$email)
//                }
//                Section(header: Text("密码")) {
//                    TextField("密码",text:self.$password)
//                    TextField("再次输入密码",text:self.$password)
//                }
//                Section {
//                    Button(action: {
//                                print("register account")
//                            }) {
//                                Text("提交")
//                            }
//                }
//            }
//            .navigationBarTitle(Text("注册"))
//        }

//
//struct RegisterView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterView()
//    }
//}
