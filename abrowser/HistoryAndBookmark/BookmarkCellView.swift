//
//  BookmarkCellView.swift
//  abrowser
//
//  Created by Apple on 2021/6/8.
//

import SwiftUI

struct BookmarkCellView: View {
    var model: ListModel
    var body: some View {
        HStack{ VStack(alignment: .leading) { Text(model.title); Text(model.subTitle) }; Spacer() }.padding()
    }
}

struct BookmarkCellView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkCellView(model: BookmarkCellView(model:ListModel(title: "Item Title", subTitle: "Item SubTitle")).previewLayout(.fixed(width: 375, height: 60)) as! ListModel
   ) }
}
