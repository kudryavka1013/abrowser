//
//  WebViewContainer.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/1.
//

import SwiftUI
import WebKit

struct WebViewContainer: UIViewRepresentable {
    @ObservedObject var navigationState : NavigationState
    @ObservedObject var historyState : HistoryState
    
    class Coordinator: NSObject, WKUIDelegate {
        var parent: WebViewContainer
        
        init(_ parent: WebViewContainer) {
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
    
    //实现协议里的makeUIView方法，用来初始化并返回一个View网页视图对象
    func makeUIView(context: Context) -> UIView {
        print("makeUIView")
        let wv = UIView()
        return wv
    }
    //实现协议里的updatedUIView方法，用来设置网页视图更新需要的参数
    func updateUIView(_ uiView: UIView, context: Context) {
        print("updateUIView")
        let webView = navigationState.selectedWebView
        webView?.uiDelegate = context.coordinator
        webView?.frame = CGRect(origin: .zero, size: uiView.bounds.size)
        
        // 视图更新
        if(uiView.subviews.first != webView){
            uiView.subviews.first?.removeFromSuperview()
            uiView.addSubview(webView!)
            navigationState.currentURL = webView?.url
            navigationState.currentTitle = webView?.title
            navigationState.canGoBack = webView!.canGoBack
            navigationState.canGoForward = webView!.canGoForward
        }
    }
        
    typealias UIViewType = UIView
}
//
extension WKWebView {
    func screenshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, 0);
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true);
        let snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return snapshotImage;
    }
    
}

//extension View {
//    func snapshot() -> UIImage {
//        let controller = UIHostingController(rootView: self)
//        let view = controller.view
//        let targetSize = controller.view.intrinsicContentSize
//        view?.bounds = CGRect(origin: .zero, size: targetSize)
//        view?.backgroundColor = .clear
//        let renderer = UIGraphicsImageRenderer(size: targetSize)
//        return renderer.image { _ in
//            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
//        }
//    }
//}

//struct WebView_Previews: PreviewProvider {
//    static var previews: some View {
//        WebView()
//    }
//}

