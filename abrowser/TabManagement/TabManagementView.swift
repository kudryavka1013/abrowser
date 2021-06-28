//
//  TabManagementView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/3.
//

import SwiftUI

struct TabManagementView: View {
    @ObservedObject var navigationState: NavigationState
    @Binding var TabManagementIsPresented : Bool
    @State var moveState = CGSize.zero
    @State var viewState = CGSize.zero
    var body: some View {
        VStack(spacing:0){
            // 将list替换为界面
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    //                Spacer()
                    ForEach(navigationState.webViews, id: \.self) { tab in
                        
                        //                    Button(action: {
                        //                        navigationState.selectedWebView = tab
                        //                        TabManagementIsPresented = false
                        //                    }) {
                        //                        Text(tab.url?.absoluteString ?? "?")
                        //                    }
                        let a = tab.screenshot
                        VStack(spacing: 0.0) {
                            HStack {
                                Text(tab.url?.absoluteString ?? "?").lineLimit(1)
                                //                                .font(.system(size: 13))
                                Spacer()
                                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                                    Image(systemName: "xmark")
                                        .foregroundColor(Color.black)
                                }
                            }
                            .padding(.all,8)
                            .background(Color.gray)
                            //                        Spacer()
                            Image( uiImage: a()!)
                                .resizable()
//                                .aspectRatio(contentMode: .fill)
                            //                            .scaledToFit()
                        }
                        .frame(width: 300.0)
//                        .padding(.leading,50)
                        .offset(x: 0 , y: moveState.height * 2)
                        .opacity(1 - Double(abs(moveState.height / 200)))
                        .animation(
                            .spring(response: 0.3, dampingFraction: 0.7, blendDuration: 0))
                        //                    .gesture(
                        //                        DragGesture()
                        //                            .onChanged { value in
                        //                                if abs(value.translation.width) < abs(value.translation.height) {
                        //                                    self.moveState.width = .zero
                        //                                    self.moveState.height = value.translation.height
                        //                                }
                        //                                }
                        //                            .onEnded { _ in
                        //                                if abs(self.moveState.height) > 150 {
                        //            //                        self.removal?()
                        //                                } else {
                        //                                    self.moveState = .zero
                        //                                }
                        //                            }
                        //                    )
                        .onTapGesture {
                            navigationState.selectedWebView = tab
                            TabManagementIsPresented = false
                        }
                    }
                }
            }
            .padding(.vertical,72)
            .background(Color.black)
//            Spacer()
            //            .frame(height: .infinity)
            
            
            HStack{
                Button(action: {
                    navigationState.deleteAllWebViews()
                    // 更改导航页显示
                    //                    navigationState.test()
                    TabManagementIsPresented = false
                }, label: {
                    Text("全部关闭")
                }).frame(minWidth: 80,alignment: .leading)
                Spacer()
                Button(action: {
                    navigationState.createNewWebView(withRequest: URLRequest(url: URL(string: "about:newtab")!))
                    TabManagementIsPresented = false
                }, label: {
                    Image(systemName: "plus")
                })
                Spacer()
                Button(action: {
                    TabManagementIsPresented = false
                }, label: {
                    Text("返回")
                }).frame(minWidth: 80 ,alignment: .trailing)
            }.padding()
        }
    }
    
    
}

//struct TabManagementView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabManagementView()
//    }
//}

//struct Tab: View {
//    @State var moveState = CGSize.zero
//    var body: some View {
//        VStack {
//            HStack {
//                Text("Title")
//                Spacer()
//                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
//                    Image(systemName: "xmark")
//                        .foregroundColor(Color.black)
//                }
//            }
//            .padding(.horizontal)
//            .padding(.top,8)
//            .padding(.bottom,8)
//            .background(Color.gray)
//            Spacer()
//            Image("screen1")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//        }
//        .frame(width: 240.0, height: 360.0)
//        .offset(x: moveState.width * 2 , y: 0)
//        .opacity(1 - Double(abs(moveState.width / 200)))
//        .gesture(
//            DragGesture()
//                .onChanged { value in
//                    if abs(value.translation.height) < abs(value.translation.width) {
//                        self.moveState.height = .zero
//                        self.moveState.width = value.translation.width
//                    }
//                    }
//                .onEnded { _ in
//                    if abs(self.moveState.width) > 100 {
////                        self.removal?()
//                    } else {
//                        self.moveState = .zero
//                    }
//                }
//        )
//}
//}
