//
//  ContentView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/5/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack(spacing:0){
            AddressBarView()
//                .background(Color.yellow)
//                .padding()
            WebView()
                .frame(maxWidth: .infinity,maxHeight: .infinity)
//                .background(Color.white)
            ZStack{
                TabBarView()
                    
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                
        }
    }
}
