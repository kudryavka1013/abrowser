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
    
    class Coordinator: NSObject, WKUIDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }

        // Delegate methods go here

        func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
//                    let alertViewController = UIAlertController(title: "提示", message:message, preferredStyle: UIAlertController.Style.alert)
//                    alertViewController.addAction(UIAlertAction(title: "确认", style: UIAlertAction.Style.default, handler: { (action) in
//                    }))
            print(message)
            completionHandler()
        }
        
        func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
//            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .actionSheet)
//            alertController.addAction(
//                UIAlertAction(title: "OK", style: .default, handler: { (action) in completionHandler(true) })
//            )
//            alertController.addAction(
//                UIAlertAction(title: "Cancel", style: .default, handler: { (action) in completionHandler(false) })
//            )
            print(message)
            completionHandler(true)
        }
        func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
            print(prompt)
            completionHandler("abc")
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    //实现协议里的makeUIView方法，用来初始化并返回一个WKWebView网页视图对象
    func makeUIView(context: Context) -> WKWebView {
        print("makeUIView")
        let wv = WKWebView()
        return wv
    }
    //实现协议里的updatedUIView方法，用来设置网页视图更新需要的参数
    func updateUIView(_ uiView: WKWebView, context: Context) {
        print("updateUIView")
//        uiView.uiDelegate = context.coordinator
        guard let webView = navigationState.selectedWebView else {
            print("no seleted webview")
            return
        }
        
        uiView.subviews.forEach { $0.removeFromSuperview() }
        webView.frame = CGRect(origin: .zero, size: uiView.bounds.size)
        webView.uiDelegate = context.coordinator
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

