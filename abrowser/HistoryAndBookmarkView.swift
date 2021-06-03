//
//  HistoryAndBookmarkView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/3.
//

import SwiftUI

struct HistoryAndBookmarkView: View {
    var body: some View {
        NavigationView {Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
            EditButton()
            

        }
        }
    }
}

struct HistoryAndBookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryAndBookmarkView()
    }
}
