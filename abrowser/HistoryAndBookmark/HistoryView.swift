//
//  HistoryView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/4.
//

import SwiftUI

/*struct WebsiteRow: View {
    
    var name : String
    
    var body: some View {
        Text("The website is \(name)")
    }
}
*/

    
struct HistoryView: View {
    var dataSource = (0..<5).map({ListModel(title: "Item \($0)", subTitle: "Sub \($0)")})
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



//
//struct HistoryView: View {
////    var model = ListModel(title: <#String#>, subTitle: <#String#>)
//
//    var dataSource = (0..<5).map({ListModel(title: "Item \($0)", subTitle: "Sub \($0)")})
//
////    var body: some View {
////        List(dataSource.identified(by: \.title)) { model in
////                ListCellView(model: model)
////            }.padding()
////        }
//
//}



struct HistoryView_Previews: PreviewProvider {

    static var previews: some View {
        HistoryView()
    }
}
