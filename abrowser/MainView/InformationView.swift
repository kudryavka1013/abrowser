//
//  InformationView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/7/5.
//

import SwiftUI

struct InformationView: View {
    @ObservedObject var informationState : InformationState
    @ObservedObject var navigationState : NavigationState
    var body: some View {
        VStack{
//            Text("新闻资讯")
            ForEach(informationState.info){ item in
                InformationCard(item:item)
                    .onTapGesture {
                        navigationState.createNewWebView(withRequest: URLRequest(url: URL(string: item.url)!))
                    }
            }
            
        }
    }
}

struct InformationCard : View{
    var item: InfoItem
    
    var body: some View{
        HStack(spacing:0){
            VStack(alignment:.leading){
                Text(item.title)
                    .lineLimit(1)
                Spacer()
                HStack{
                    Text("来自：\(item.source)")
                        .font(.caption)
                    Spacer()
                    Text(item.createdate)
                        .font(.caption)
                }
            }
            .padding(8)
        }
        .frame(height:60)
        .background(Color("AddressBarColor"))
        .cornerRadius(6.0)
        .shadow(radius: 1)
        .padding(.horizontal,16)
    }
}

//struct InformationView_Previews: PreviewProvider {
//    static var previews: some View {
//        InformationCard()
//    }
//}
