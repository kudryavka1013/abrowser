//
//  SearchView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/7.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var navigationState : NavigationState
    @Binding var SearchIsPresented : Bool
    @Binding var NavViewIsPresented : Bool
    let addressbar: Namespace.ID
    @State var addressInput = ""
    @State var currentURL = ""
    var body: some View {
        VStack{
            HStack{
                ZStack{
                    TextField(navigationState.currentURL?.absoluteString ?? "", text: $addressInput,onCommit: {
                        // 正则
                        let pattern = "((https|http)://)?(www\\.)?[\\w\\d\\-_]+\\.\\w{2,3}(\\.\\w{2})?(/(?<=/)([\\w\\d\\-./_]+)?)?"
                        let regex = try! NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
                        // 格式化输入
                        let formatString = addressInput.trimmingCharacters(in: NSCharacterSet.whitespaces)
                        let range = NSMakeRange(0, formatString.count)
                        // 正则匹配
                        let results = regex.numberOfMatches(in: formatString, options: [], range: range)
                        
                        var addressToGo = ""
                        if(results == 1){
                            if(formatString.hasPrefix("https://") || formatString.hasPrefix("http://")){
                                addressToGo = formatString
                            }
                            else{
                                addressToGo = "https://" + formatString
                            }
                        }else{
                            addressToGo = "https://cn.bing.com/search?q=" + formatString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
                        }
                        if(navigationState.webViews == []){
                            navigationState.createNewWebView(withRequest: URLRequest(url: URL(string: addressToGo)!))
                        }else{
                            navigationState.navGoTo(addressInput: addressToGo)
                        }
                        SearchIsPresented = false
                        NavViewIsPresented = false
                    })
                    .onAppear(){
                        addressInput = navigationState.currentURL?.absoluteString ?? ""
                    }
                    // 关闭自动大小写和自动更正
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    // 更改键盘样式
                    .keyboardType(.webSearch)
                    .padding(.horizontal)
                    .zIndex(1)
                    if(SearchIsPresented){
                        RoundedRectangle(cornerRadius: 18,style: RoundedCornerStyle.continuous)
                            .fill(Color.white)
                            .frame(maxHeight:36)
                            .shadow(radius: 1)
                            .matchedGeometryEffect(id: "addressbar", in: addressbar)
                    }
                    
                }
                Button(action: {
                    SearchIsPresented = false
                }, label: {
                    Text("取消")
                })
                
                
            }
            .padding(.horizontal)
            .padding(.vertical, 5)
            if ((navigationState.image) != nil){
                Image(uiImage: navigationState.image!)
            }else{
                Rectangle()
            }

            Spacer()
        }
    }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
