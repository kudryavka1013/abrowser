//
//  AddressBarView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/1.
//

import SwiftUI

struct AddressBarView: View {
    @State private var inputMessage = ""
    @State private var urlString = ""
    var body: some View {
        HStack{
            ZStack{
                TextField("placeholder", text: $inputMessage)
//                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
//                    .cornerRadius(16.0)
                    .padding(.horizontal)
                    .zIndex(1)
//                    .background(Color.blue)
//                    .shadow(radius: 10)
                RoundedRectangle(cornerRadius: 18,style: RoundedCornerStyle.continuous)
                    .fill(Color.gray)
                    .frame(maxHeight:36)
                
                    
            }
            Button(action: {}, label: {
                Image(systemName: "arrow.clockwise")
            })
        }
        .padding(.horizontal)

    }
}

struct AddressBarView_Previews: PreviewProvider {
    static var previews: some View {
        AddressBarView()
    }
}
