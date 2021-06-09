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
    
    @discardableResult func createNewWebView(withRequest request: URLRequest) -> WKWebView {
        let wv = WKWebView()
        wv.navigationDelegate = self
        webViews.append(wv)
        selectedWebView = wv
        wv.load(request)
        return wv
    }
    
    func deleteWebView(){}
    
    func deleteAllWebViews(){
        webViews.removeAll()
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
    
    func navGoTo(addressInput : String){
        self.selectedWebView?.load(URLRequest(url: URL(string: addressInput)!))
    }
}

// 导航代理方法，追踪WKWebView加载过程
extension NavigationState : WKNavigationDelegate {
    //页面开始加载时调用
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!){
        
    }
    
    //当内容开始返回时调用
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        if webView == selectedWebView {
            self.currentURL = webView.url
            // 上一页按钮和下一页按钮是否可点
            self.canGoBack = webView.canGoBack
            print(canGoBack)
            self.canGoForward = webView.canGoForward
        }
    }
    
    // 页面加载完成之后调用
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
        if webView == selectedWebView {
            // 页面标题
            self.currentTitle = webView.title
        }
    }
    //页面加载失败时调用
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error){
        
    }
}

extension NavigationState : WKUIDelegate {
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        return webView
    }
}
