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
                        Section(header: Text("昨天晚上")) {
                            ForEach(0..<2) {
                                let model = HistoryModel(title: "和生活-畅享移动新生活-和生活", subTitle: "https://www.baicu.com-\($0)")
                                HistoryCellView(model: model)
                            }.onDelete(perform: deleteRow)
                        }
                    
                    } else if ($0 == 1) {
                        Section(header: Text("今天早上")) {
                            ForEach(0..<5) {
                                let model = HistoryModel(title: "和生活-畅享移动新生活-和生活", subTitle: "https://www.baicu.com-\($0)")
                                HistoryCellView(model: model)
                            }.onDelete(perform: deleteRow)
                        }
                    } else {
                        Section(header: Text("今天中午")) {
                            ForEach(0..<5) {
                                let model = HistoryModel(title: "国家医疗保障", subTitle: "https://www.govn.com-\($0)")
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

struct HistoryModel : Identifiable{
    var id = UUID()
    
    var title: String
    var subTitle: String
    
    init(title: String, subTitle: String) {
        self.title = title
        self.subTitle = subTitle
    }
}

    
//struct HistoryView: View {
//    var dataSource = (0..<5).map({ListModel(title: "Item \($0)", subTitle: "Sub \($0)")})
//        var body: some View {
//            List(dataSource) { model in
//                HistoryCellView(model: model)
//            }.padding()
//        }
//}
//
//struct ListModel : Identifiable{
//    var id = UUID()
//
//    var title: String
//    var subTitle: String
//
//    init(title: String, subTitle: String) {
//        self.title = title
//        self.subTitle = subTitle
//    }
//}





struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        //ListDemo()
        HistoryView()
    }
}
    
