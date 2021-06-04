//
//  HistoryAndBookmarkView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/3.
//

import SwiftUI

struct HistoryAndBookmarkView: View {
    @Binding var viewSelected : Int
    @Binding var isPresented : Bool
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
                    .background(Color.green)
                HStack{
                    Spacer()
                    Button(action: {
                        // 清除
                    }, label: {
                        Text("清除")
                    })
                }
                .padding(.horizontal)
                .padding(.top, 4)
                .padding(.bottom)

            case 2:
                BookmarkView()
                    .frame(maxWidth: .infinity,maxHeight:.infinity)
                    .background(Color.gray)
                HStack{
                    Button(action: {
                        // 添加
                    }, label: {
                        Image(systemName: "plus")
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
                HistoryView()
                    .frame(maxWidth: .infinity,maxHeight:.infinity)
                    .background(Color.green)
                HStack{
                    Spacer()
                    Button(action: {
                        // 清除
                    }, label: {
                        Text("清除")
                    })
                }
                .padding(.horizontal)
                .padding(.top, 4)
                .padding(.bottom)

            }
            
            
        }
    }
    
}

struct HistoryAndBookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryAndBookmarkView(viewSelected: .constant(2), isPresented: .constant(false))
    }
}
