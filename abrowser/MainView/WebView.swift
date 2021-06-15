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
    //实现协议里的makeUIView方法，用来初始化并返回一个WKWebView网页视图对象
    func makeUIView(context: Context) -> WKWebView {
        print("makeUIView")
        let config = WKWebViewConfiguration()
        let wv = WKWebView()
        return wv
    }
    //实现协议里的updatedUIView方法，用来设置网页视图更新需要的参数
    func updateUIView(_ uiView: WKWebView, context: Context) {
        print("updateUIView")
        guard let webView = navigationState.selectedWebView else {
            print("no seleted webview")
            return
        }
        
        uiView.subviews.forEach { $0.removeFromSuperview() }
        webView.frame = CGRect(origin: .zero, size: uiView.bounds.size)
        uiView.addSubview(webView)
        
    }
    
    typealias UIViewType = WKWebView
}

extension WKWebView {
    func screenshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, 0);
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true);
        let snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return snapshotImage;
    }
}

//struct WebView_Previews: PreviewProvider {
//    static var previews: some View {
//        WebView()
//    }
//}

