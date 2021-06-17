//
//  HistoryAndBookmarkView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/3.
//

import SwiftUI

struct HistoryAndBookmarkView: View {
    @ObservedObject var navigationState : NavigationState
    @ObservedObject var historyState : HistoryState
    @ObservedObject var bookmarkState : BookmarkState
    @Binding var viewSelected : Int
    @Binding var isPresented : Bool
    
//    @State var isEditing = false
//    @State var clearBtnIsPresented = false
    var body: some View {
        NavigationView{
            VStack(spacing:0){
                // 选择器
                Picker("testPicker", selection: $viewSelected, content: {
                    Text("历史记录").tag(1)
                    Text("书签").tag(2)
                })
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                .padding(.bottom,8)
                .padding(.top,8)
                // 子页面
                if(viewSelected == 1){
                    HistoryView(historyState: historyState, navigationState: navigationState, isPresented: $isPresented)
                        .frame(maxWidth: .infinity,maxHeight:.infinity)
                    
                }else{
                    BookmarkView(navigationState: navigationState,bookmarkState: bookmarkState, isPresented: $isPresented)
                        .frame(maxWidth: .infinity,maxHeight:.infinity)
                }
            }
            .navigationBarBackButtonHidden(false)
            .navigationBarTitle((viewSelected == 1) ? "历史记录" : "书签" ,displayMode: .inline)
            .navigationBarItems(trailing:
                Button("完成"){ isPresented = false }
            )
            // NavgationView end
        }
    }
}





//struct HistoryAndBookmarkView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryAndBookmarkView(navigationState: navigationState, viewSelected: .constant(1), isPresented: .constant(false))
//    }
//}
