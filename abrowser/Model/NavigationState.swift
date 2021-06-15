//
//  NavigationState.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/3.
//

import SwiftUI
import WebKit

class NavigationState : NSObject, ObservableObject{
    @Published var currentURL : URL?
    @Published var webViews : [WKWebView] = []
    @Published var selectedWebView : WKWebView?
    @Published var currentTitle : String?
    @Published var canGoBack : Bool = false
    @Published var canGoForward : Bool = false
    
    @Published var image : UIImage?
    @Published var images : [UIImage] = []
    @discardableResult func createNewWebView(withRequest request: URLRequest) -> WKWebView {
        let wv = WKWebView()
        wv.navigationDelegate = self
        wv.uiDelegate = self
        webViews.append(wv)
        selectedWebView = wv
        wv.load(request)
        return wv
    }
    
    override init() {
        super.init()
        let wv = WKWebView()
        wv.navigationDelegate = self
        wv.uiDelegate = self
        webViews.append(wv)
        wv.load(URLRequest(url: URL(string: "https://www.baidu.com")!))
        selectedWebView = wv
    }
    
    func deleteWebView(){}
    
    func deleteAllWebViews(){
        webViews.removeAll()
        createNewWebView(withRequest: URLRequest(url: URL(string: "https://www.baidu.com")!))
    }
    
    func screenshot(){
        image = self.selectedWebView?.screenshot()
    }
    
    func navGoBack(){
        if(self.canGoBack){
            self.selectedWebView?.goBack()
        }
    }
    
    func navGoForward(){
        if(self.canGoForward){
            self.selectedWebView?.goForward()
        }
    }
    
    func refresh(){
        if(self.selectedWebView?.isLoading == true){
            self.selectedWebView?.stopLoading()
        }else{
            self.selectedWebView?.reload()
        }
    }
    
    func navGoTo(addressInput: String){
        self.selectedWebView?.load(URLRequest(url: URL(string: addressInput)!))
    }
}

// 导航代理方法，追踪WKWebView加载过程
extension NavigationState : WKNavigationDelegate{
    //页面开始加载时调用
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!){
        print("didStart")
    }
    
    //当内容开始返回时调用
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("didCommit")
        if webView == selectedWebView {
            self.currentURL = webView.url
            // 上一页按钮和下一页按钮是否可点
            self.canGoBack = webView.canGoBack
            self.canGoForward = webView.canGoForward
        }
    }
    
    // 页面加载完成之后调用
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
        print("didFinish")
        if webView == selectedWebView {
            // 页面标题
            self.currentTitle = webView.title
        }
    }
    //页面加载失败时调用
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error){
        print("didFail")
    }
}

extension NavigationState : WKUIDelegate {
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        return webView
    }
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        //        let alertViewController = UIAlertController(title: "提示", message:message, preferredStyle: UIAlertController.Style.alert)
        //        alertViewController.addAction(UIAlertAction(title: "确认", style: UIAlertAction.Style.default, handler: { (action) in
        //            completionHandler()
        //        }))
        //        self.present(alertViewController, animated: true)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        //        let alertVicwController = UIAlertController(title: "提示", message: message, preferredStyle: UIAlertController.Style.alert)
        //                alertVicwController.addAction(UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: { (alertAction) in
        //                    completionHandler(false)
        //                }))
        //                alertVicwController.addAction(UIAlertAction(title: "确定", style: UIAlertAction.Style.default, handler: { (alertAction) in
        //                    completionHandler(true)
        //                }))
        //                self.present(alertVicwController, animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        //            let alertViewController = UIAlertController(title: prompt, message: "", preferredStyle: UIAlertController.Style.alert)
        //                    alertViewController.addTextField { (textField) in
        //                        textField.text = defaultText
        //                    }
        //                    alertViewController.addAction(UIAlertAction(title: "完成", style: UIAlertAction.Style.default, handler: { (alertAction) in
        //                        completionHandler(alertViewController.textFields![0].text)
        //                    }))
        //                    self.present(alertViewController, animated: true, completion: nil)
    }
}
