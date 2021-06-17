//
//  HistoryAndBookmarkView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/3.
//

import SwiftUI

struct HistoryAndBookmarkView: View {
    @ObservedObject var navigationState : NavigationState
    @Binding var viewSelected : Int
    @Binding var isPresented : Bool
    
    @State var clearBtnIsPresented = false
    var body: some View {
        VStack{
            // 顶部标题
            ZStack{
                Text(viewSelected == 1 ? "历史记录" : "书签")
                HStack{
                    Spacer()
                    Button(action: {
                        isPresented = false
                    }) {
                        Text("完成")
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top)
            // 选择器
            Picker("testPicker", selection: $viewSelected, content: {
                Text("历史记录").tag(1)
                Text("书签").tag(2)
            })
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            
            // 子页面
            switch viewSelected {
            case 1:
                HistoryView()
                    .frame(maxWidth: .infinity,maxHeight:.infinity)
                HStack{
                    Spacer()
                    Button(action: {
                        // 清除
                        self.clearBtnIsPresented = true
                    }, label: {
                        Text("清除")
                    })
                    .actionSheet(isPresented: $clearBtnIsPresented) {
                        ActionSheet(title: Text("清除历史记录"), buttons: [
                            .destructive(Text("今天")) { },
                            .destructive(Text("今天和昨天")) { },
                            .destructive(Text("全部")) { },
                            .cancel(Text("取消"))
                        ])
                    }
                }
                .padding(.horizontal)
                .padding(.top, 4)
                .padding(.bottom)
                
            case 2:
                
                BookmarkView(navigationState: navigationState,isPresented: $isPresented)
                    .frame(maxWidth: .infinity,maxHeight:.infinity)
                    .background(Color.gray)
                HStack{
                    Button(action: {
                        // 添加
                    }, label: {
                        Text("新建文件夹")
                    })
                    Spacer()
                    
                    Button(action: {
                        // 编辑
                    }, label: {
                        Text("编辑")
                    })
                }
                .padding(.horizontal)
                .padding(.top, 4)
                .padding(.bottom)
                
            default:
                BookmarkView(navigationState: navigationState, isPresented: $isPresented)
                    .frame(maxWidth: .infinity,maxHeight:.infinity)
                    .background(Color.gray)
                HStack{
                    Button(action: {
                        // 添加
                    }, label: {
                        Text("新建文件夹")
                    })
                    Spacer()
                    
                    Button(action: {
                        // 编辑
                    }, label: {
                        Text("编辑")
                    })
                }
                .padding(.horizontal)
                .padding(.top, 4)
                .padding(.bottom)
            }
            
            
        }
    }
    
}



//struct HistoryAndBookmarkView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryAndBookmarkView(navigationState: navigationState, viewSelected: .constant(1), isPresented: .constant(false))
//    }
//}
