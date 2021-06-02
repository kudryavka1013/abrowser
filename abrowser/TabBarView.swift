//
//  TabBarView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/1.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        HStack{
            Button(action: {}, label: {
                Image(systemName: "chevron.left")
            })
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "chevron.right")
                
            })
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "house")
            })
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "square.on.square")
            })
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "slider.vertical.3")
            })
        }
        .foregroundColor(Color.gray)
        .padding()
//        .padding(.horizontal, 20)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
