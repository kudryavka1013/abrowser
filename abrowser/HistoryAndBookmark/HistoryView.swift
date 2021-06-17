//
//  HistoryView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/4.
//

import SwiftUI

struct HistoryView: View {
    
    func deleteRow(at offsets:IndexSet) {
        print("删除");
    }
    
    var body: some View {
        
        VStack {
            List {
                //造数据
                ForEach(0..<3) {
                    if ($0 == 0) {
                        Section(header: Text("今天")) {
                            ForEach(0..<2) {
                                let model = HistoryModel(websitename: "和生活-畅享移动新生活-和生活", websiteURL: "https://www.baicu.com-\($0)",responsetime: "20210617")
                                HistoryCellView(model: model)
                            }.onDelete(perform: deleteRow)
                        }
                    
                    } else if ($0 == 1) {
                        Section(header: Text("今天和昨天")) {
                            ForEach(0..<5) {
                                let model = HistoryModel(websitename: "和生活-畅享移动新生活-和生活", websiteURL: "https://www.baicu.com-\($0)",responsetime: "20210617")
                                HistoryCellView(model: model)
                            }.onDelete(perform: deleteRow)
                        }
                    } else {
                        Section(header: Text("全部")) {
                            ForEach(0..<5) {
                                let model = HistoryModel(websitename: "国家医疗保障", websiteURL: "https://www.govn.com-\($0)",responsetime: "20210617")
                                HistoryCellView(model: model)
                            }.onDelete(perform: deleteRow)
                        }
                    }
                }
            }
            //.listStyle(GroupedListStyle()) 
//            .background(Color.white)
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        //ListDemo()
        HistoryView()
    }
}
    
