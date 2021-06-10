//
//  HistoryView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/4.
//

import SwiftUI



struct HistoryView: View {
    //dataSource:[ListModel] 变量，并使用 map 对其进行初始化
    var dataSource = (0..<5).map({ListModel(title: "Item \($0)", subTitle: "Sub \($0)")})
//初始化后的 dataSource 中包含了5个 ListModel，接下来将 dataSource 作为数据源，绑定到 List 中：
    
    
    
    var body: some View {


        List(dataSource) { model in
            HistoryCellView(model: model)
        }.padding()
    }
}

struct ListModel : Identifiable{
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


//struct ListDemo : View{
//    var dataSource1 = (0..<5).map({ListModel(title: "Item \($0)", subTitle: "Sub \($0)")})
//    var dataSource2 = (0..<5).map({ListModel(title: "Item \($0)", subTitle: "Sub \($0)")})
//    var arr : Array<Any>
//    arr.append(dataSource1)
//    var body: some View {
//        List(dataSource){ group in
//            // group
//            Section(header: Text("昨天")){
//                List(group){ model in
//                    HistoryCellView(model: model)
//                }
//            }
//        }.listStyle(GroupedListStyle())
//    }
//}


struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        //ListDemo()
        HistoryView()
    }
}
    
