//
//  WebView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/1.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    @ObservedObject var navigationState : NavigationState
    
    //    let urlString: String = "https://www.baidu.com"
    //实现协议里的makeUIView方法，用来初始化并返回一个WKWebView网页视图对象
    func makeUIView(context: Context) -> WKWebView {
        //        let webView = WKWebView()
        return WKWebView()
    }
    //接着实现协议里的updatedUIView方法，用来设置网页视图需要更新参数
    func updateUIView(_ uiView: WKWebView, context: Context) {
        //        if let url = URL(string: urlString) {
        //            let request = URLRequest(url: url)
        //            uiView.load(request)
        //        }
        guard let webView = navigationState.selectedWebView else {
            return
        }
        if webView != uiView.subviews.first {
            uiView.subviews.forEach { $0.removeFromSuperview() }
            
            webView.frame = CGRect(origin: .zero, size: uiView.bounds.size)
            uiView.addSubview(webView)
        }
    }
    
    typealias UIViewType = WKWebView
}


//struct WebView_Previews: PreviewProvider {
//    static var previews: some View {
//        WebView()
//    }
//}
