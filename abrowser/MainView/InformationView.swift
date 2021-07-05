//
//  InformationView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/7/5.
//

import SwiftUI

struct InformationView: View {
    @ObservedObject var informationState : InformationState
    var body: some View {
        List{
            VStack{
                InformationCard()
                InformationCard()
                InformationCard()
            }
            
        }.onAppear{
            informationState.getInfomation()
        }
    }
}

struct InformationCard : View{
    var body: some View{
        HStack(spacing:0){
            Image("screen1")
                .resizable()
                .frame(width: 120)
                .padding(8)
            VStack(alignment:.leading){
                Text("标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题")
                    .lineLimit(1)
                    Spacer()
                HStack{
                    Text("来自：")
                        .font(.caption)
                    Spacer()
                    Text("20-1-26")
                        .font(.caption2)
                }
            }
            .padding(.vertical,8)
            .padding(.trailing,8)
        }
        .frame(height:70)
        .background(Color.gray)
        .cornerRadius(6.0)
        .shadow(radius: 2)
        .padding(.horizontal,16)
    }
}

//struct InformationView_Previews: PreviewProvider {
//    static var previews: some View {
//        InformationCard()
//    }
//}
