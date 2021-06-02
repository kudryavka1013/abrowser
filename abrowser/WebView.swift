//
//  WebView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/1.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let urlString: String = "https://www.baidu.com"
    //实现协议里的makeUIView方法，用来初始化并返回一个WKWebView网页视图对象
    func makeUIView(context: Context) -> WKWebView {
        //        guard let url = URL(string: self.urlString) else {
        //            return WKWebView()
        //        }
        //        let requeset = URLRequest(url: url)
        //        let wk = WKWebView()
        //        wk.isOpaque = false
        //        wk.load(requeset)
        //        return wk
        // qwerty
        let webView = WKWebView()
        return webView
    }
    //接着实现协议里的updatedUIView方法，用来设置网页视图需要更新参数
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
    
    typealias UIViewType = WKWebView
}


struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView()
    }
}
