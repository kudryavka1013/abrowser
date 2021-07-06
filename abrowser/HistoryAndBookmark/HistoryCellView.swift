//
//  HistoryCellView.swift
//  abrowser
//
//  Created by YJY on 2021/6/7.
//

import SwiftUI

struct HistoryCellViewSearch: View {
    var model: HistoryModel
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(model.websitename).lineLimit(1).offset( y: 2)
                Text(model.websiteURL).lineLimit(1).offset( y: 1)
            }.padding(.leading, 20)
            Spacer()
        }.frame(height: 45)
        Divider()
            .frame(width: 380)
            .background(Color.gray)
    }
}

struct HistoryCellView: View {
    var model: HistoryModel
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(model.websitename).lineLimit(1)
                Text(model.websiteURL).lineLimit(1)
            }
            Spacer()
        }//.padding()
    }
}

//struct HistoryCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryCellView().previewLayout(.fixed(width: 375, height: 60))
//    }
//}
