//
//  LoginView.swift
//  abrowser
//
//  Created by YJY on 2021/6/23.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct LoginView : View {
    
    @ObservedObject var userState : UserState
    @ObservedObject var userPreferences: UserPreferences
    //@ObservedObject var registerView : RegisterView
    @State private var isDispaly: Bool = false
    @State var username: String = ""
    @State var password: String = ""
    
    @Binding var selectIsPresented : Bool
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
                    HStack {
                        Image("用户")
                            .frame(width: 40, height:40)
//                        Rectangle()
//                            .fill(Color("ButtonTextColor"))
//                            .frame(width: 1, height: 18)
                        TextField("请输入账号", text: $username)
                            .offset(x : 2)
                            .frame(width: 309, height: 40)
                            //.fill(Color("PageButtonTextColor"))
                    }
                    Divider()
                        .frame(width: 380)
                        .background(Color.gray)
                }
                .padding(.vertical)
                
                
                VStack {
                    HStack{
                        Image("密码")
                            .frame(width: 40, height:40)
//                        Rectangle()
//                            .fill(Color("ButtonTextColor"))
//                            .frame(width: 1, height: 18)
                        HStack {
                                if isDispaly {
                                    TextField("请输入密码", text: $password)
                                        .offset(x : 2)
                                        .frame(width: 260, height: 40)
                                }
                                else {
                                    SecureField("请输入密码", text: $password)
                                        .offset(x : 2)
                                        .frame(width: 260, height: 40)
                                }
                            Button(action: {
                                isDispaly = !isDispaly
                            }) {
                                Image(systemName: self.isDispaly ? "eye.slash" : "eye")
                                    .frame(width: 40, height:40)
                                    .accentColor(.gray)
                            }
                        }
//                            .frame(width: 350, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                                .background(Color.white)
                    }
                    Divider()
                        .frame(width: 350)
                        .background(Color.gray)
                }
                .padding(.vertical)
                
                Spacer().frame(width: 100, height: 60)
                
            Button(action: {selectIsPresented = false ; userState.Login()}
                ){
              
                    Text("登录")
                        .fontWeight(.bold)
                        .bold()
                        .foregroundColor(.white)
                
                }
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
        }
    }
    
}
        
        
        
//        VStack {
//            Spacer().frame(width: 100, height: 60)
//            VStack {
//                Text("账号")
//                    .font(.callout)
//                    .offset(x: 2)
//                   // .bold()
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                TextField("请输入账号", text: $username)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 8, style: .continuous)
//                        .stroke(Color.black, lineWidth: 1)
//                    )
//                    .padding(10)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .frame(width:300)
//                    .padding(.vertical,8)
//                    Spacer()
//                    .frame(width: 100, height: 25, alignment: .center)
//                Text("密码")
//                    .font(.callout)
//                    .bold()
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                SecureField("请输入密码", text: $password)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//            }.padding()
//
////            Spacer().frame(width: 100, height: 60)
//
//            Button(action: {
//                    }) {
//                            Text("登录")
//                            .fontWeight(.bold)
//                            .bold()
//                            .foregroundColor(.white)
//                    }
//                    .frame(width: UIScreen.main.bounds.width - 32, height: 44, alignment: .center)
//                    .background(Color.blue)
//                    .cornerRadius(22)
//
//                    Spacer()
//                }
//                .onTapGesture {
//                    print("tap")
//                    self.hideKeyboard()
//                }
//        }
//}
//    var body: some View{
//        Form{
//
//
//            Circle()
//                .fill(Color.blue)
//                .overlay(Circle().strokeBorder(Color.white).padding(3))
//                .overlay(Text("登陆").font(.title).foregroundColor(.white))
//                .frame(width:100,height:100)
//                HStack{
//                    Text("账号").font(.title)
//                    TextField("Enter your email", text: $account)
//                        .overlay(
//                             RoundedRectangle(cornerRadius: 8, style: .continuous)
//                                .stroke(Color.black, lineWidth: 1)
//                        )
//                        .padding(10)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .frame(width:250)
//                        .padding(.vertical,8)
//                }
//                HStack{
//                    Text("密码").font(.title)
//                    TextField("Enter your password", text: $password)
//                        .overlay(
//                             RoundedRectangle(cornerRadius: 8, style: .continuous)
//                                .stroke(Color.black, lineWidth: 1)
//                        )
//                        .padding(10)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .frame(width:250)
//                        .padding(.vertical,8)
//                }
            //.frame(width:350, height: 140)
            //.background(Color(red: 235/255, green: 235/255, blue: 235/255, opacity: 1.0))
            //.cornerRadius(12.0)
//            HStack{
//                ZStack{
//                    RoundedRectangle(cornerRadius: 18,style: RoundedCornerStyle.continuous)
//                        .stroke(Color("PageButtonTextColor"),lineWidth: 1)
//                        .frame(width: 320, height: 40)
//                        .shadow(radius: 1)
//                    Button("登陆"){
//                        //点击登录
//                    }.frame(maxWidth:.infinity)
//                }
//                .frame(maxWidth: .infinity)
//                .foregroundColor(Color("ButtonTextColor"))
                
//                ZStack{
//                    RoundedRectangle(cornerRadius: 18,style: RoundedCornerStyle.continuous)
//                        .stroke(Color("PageButtonTextColor"),lineWidth: 1)
//                        .frame(width: 80, height: 40)
//                        .shadow(radius: 1)
//                    Button("注册"){
//                        //点击注册
//                    }.frame(maxWidth:.infinity)
//                }
//                .frame(maxWidth: .infinity)
//                .foregroundColor(Color("ButtonTextColor"))
//            }
//        }
//    }
//
//}
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}

