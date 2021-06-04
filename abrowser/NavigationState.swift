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
    
    @discardableResult func createNewWebView(withRequest request: URLRequest) -> WKWebView {
           let wv = WKWebView()
           wv.navigationDelegate = self
           webViews.append(wv)
           selectedWebView = wv
           wv.load(request)
           return wv
    }
    
    @discardableResult func deleteWebView(){}
    
    @discardableResult func deleteAllWebViews(){}
    
    func navGoBack(){
        self.selectedWebView?.goBack()
    }
    
    func navGoForward(){
        self.selectedWebView?.goForward()
    }
}

extension NavigationState : WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        if webView == selectedWebView {
            self.currentURL = webView.url
        }
    }
}
