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
                    .fill(Color.white)
                    .frame(maxHeight:36)
                    .shadow(radius: 2)
                //                    .border(Color.gray)
                
                
            }
            ZStack{
                Button(action: {}, label: {
                    Image(systemName: "arrow.triangle.2.circlepath")
                    //                    Image(systemName:"xmark")
                })
                    .zIndex(1.0)
                Circle()
                    .fill(Color.white)
                    .frame(maxWidth: 36, maxHeight:36)
                    .shadow(radius: 2)
                
            }
            
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
        
    }
}

struct AddressBarView_Previews: PreviewProvider {
    static var previews: some View {
        AddressBarView()
    }
}
