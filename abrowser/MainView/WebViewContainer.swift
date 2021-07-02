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
            let alertController = UIAlertController(title: "提示", message: message, preferredStyle: .alert)
            alertController.addAction(
                UIAlertAction(title: "确定", style: .default, handler: { (action) in completionHandler() })
            )
            if let controller = topMostViewController() {
                controller.present(alertController, animated: true, completion: nil)
            }
        }
        
        func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
            let alertController = UIAlertController(title: "提示", message: message, preferredStyle: .alert)
            
            alertController.addAction(
                UIAlertAction(title: "取消", style: .destructive, handler: { (action) in completionHandler(false) })
            )
            alertController.addAction(
                UIAlertAction(title: "确定", style: .default, handler: { (action) in completionHandler(true) })
            )
            if let controller = topMostViewController() {
                controller.present(alertController, animated: true, completion: nil)
            }
        }
        
        func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
            let alertController = UIAlertController(title: "提示", message: prompt, preferredStyle: .alert)
            alertController.addTextField{ textField in
                textField.placeholder = defaultText }
            alertController.addAction(
                UIAlertAction(title: "取消", style: .destructive, handler: { (action) in
                                completionHandler(nil) }))
            alertController.addAction(
                UIAlertAction(title: "确定", style: .default, handler: { (action) in
                                if let text = alertController.textFields?.first?.text {
                                    completionHandler(text)
                                } else {
                                    completionHandler(defaultText)
                                }})
            )
            if let controller = topMostViewController() {
                controller.present(alertController, animated: true, completion: nil)
            }
        }
        
        private func topMostViewController() -> UIViewController? {
            guard let rootController = keyWindow()?.rootViewController else {
                return nil
            }
            return topMostViewController(for: rootController)
        }
        
        private func keyWindow() -> UIWindow? {
            return UIApplication.shared.connectedScenes
                .filter {$0.activationState == .foregroundActive}
                .compactMap {$0 as? UIWindowScene}
                .first?.windows.filter {$0.isKeyWindow}.first
        }
        
        private func topMostViewController(for controller: UIViewController) -> UIViewController {
            if let presentedController = controller.presentedViewController {
                return topMostViewController(for: presentedController)
            } else if let navigationController = controller as? UINavigationController {
                guard let topController = navigationController.topViewController else {
                    return navigationController
                }
                return topMostViewController(for: topController)
            } else if let tabController = controller as? UITabBarController {
                guard let topController = tabController.selectedViewController else {
                    return tabController
                }
                return topMostViewController(for: topController)
            }
            return controller
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

