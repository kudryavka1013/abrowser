//
//  NavView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/4.
//

import SwiftUI

struct NavView: View {
    @Binding var NavViewIsPresented : Bool
    var body: some View {
        Text("Hello, World!")
            .background(Color.black)
            .foregroundColor(.blue)
    }
}

struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView(NavViewIsPresented: .constant(true))
    }
}
