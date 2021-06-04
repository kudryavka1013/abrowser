//
//  ContentView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/5/31.
//

import SwiftUI

struct ContentView: View {
    @StateObject var navigationState = NavigationState()
    @State var MenuIsPresented = false
    var body: some View {
        ZStack{
            VStack(spacing:0){
                AddressBarView(navigationState: navigationState)
                //                .background(Color.yellow)
                //                .padding()
                
                // progressbar needed!!!
                
                WebView(navigationState: navigationState)
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                //                .background(Color.white)
                NavBarView(navigationState: navigationState)
                
            }
            //            if TabManagementIsPresented{
            //                TabManagementView(navigationState: navigationState, TabManagementIsPresented: $TabManagementIsPresented)
            ////            }
            //            MenuView(MenuIsPresented: $MenuIsPresented)
        }
        
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            ContentView()
//                
//        }
//    }
//}
