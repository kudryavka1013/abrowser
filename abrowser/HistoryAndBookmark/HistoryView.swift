//
//  HistoryView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/4.
//

import SwiftUI

struct HistoryView: View {
    @State var clearBtnIsPresented = false
    @ObservedObject var historyState : HistoryState
    @ObservedObject var navigationState : NavigationState
    @Binding var isPresented : Bool
    
    func deleteRowToday(at offsets:IndexSet) {
        historyState.historytoday.remove(atOffsets: offsets)
    }
    
    func deleteRowYesterday(at offsets:IndexSet) {
        historyState.historyyesterday.remove(atOffsets: offsets)
    }
    
    func deleteRowAgo(at offsets:IndexSet) {
        historyState.historyago.remove(atOffsets: offsets)
    }
    
    var body: some View {
        VStack{
            List{
                if (!historyState.historytoday.isEmpty) {
                        Section(header: Text("今天")) {
                            ForEach(historyState.historytoday) { item in
                                HistoryCellView(model: item)
                                    .onTapGesture {
                                        navigationState.navGoTo(addressInput: item.websiteURL)
                                        isPresented = false
                                    }
                            }.onDelete(perform: deleteRowToday)
                        }
                    }
                if (!historyState.historyyesterday.isEmpty) {
                        Section(header: Text("昨天")) {
                            ForEach(historyState.historyyesterday) { item in
                                HistoryCellView(model: item)
                                    .onTapGesture {
                                    navigationState.navGoTo(addressInput: item.websiteURL)
                                        isPresented = false

                                }
                            }.onDelete(perform: deleteRowYesterday)
                        }
                    }
                if (!historyState.historyago.isEmpty) {
                        Section(header: Text("两天前")) {
                            ForEach(historyState.historyago) { item in
                                HistoryCellView(model: item)
                                    .onTapGesture {
                                        navigationState.navGoTo(addressInput: item.websiteURL)
                                        isPresented = false

                                    }
                            }.onDelete(perform: deleteRowAgo)
                        }
                    }
                }
            
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
                        .destructive(Text("今天")) {
                            historyState.deleteTodayHistory()
                        },
                        .destructive(Text("今天和昨天")) {
                            historyState.deleteTodayandYesterdayHistory()
                        },
                        .destructive(Text("全部")) {
                            historyState.deleteAllHistory()
                            
                        },
                        .cancel(Text("取消"))
                    ])
                }
            }
            .padding(.horizontal)
            .padding(.top, 8)
            .padding(.bottom)
            //.listStyle(GroupedListStyle()) 
            //            .background(Color.white)
        }
    }
}

//struct HistoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        //ListDemo()
//        HistoryView()
//    }
//}

