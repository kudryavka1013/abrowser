//
//  HistoryCellView.swift
//  abrowser
//
//  Created by YJY on 2021/6/7.
//

import SwiftUI

struct HistoryCellView: View {
    var model: HistoryModel
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(model.websitename)
                Text(model.websiteURL)
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
