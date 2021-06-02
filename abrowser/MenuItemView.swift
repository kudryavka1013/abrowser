//
//  MenuItemView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/2.
//

import SwiftUI

struct MenuItemView: View {
    @State var image :String
    @State var label :String
    var body: some View {
        Button(action: {print(label)}, label: {
            VStack{
                Image(systemName: image)
                Text(label)
            }
        })
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(image:"",label:"")
    }
}
