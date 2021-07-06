//
//  NavigationState.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/3.
//

import SwiftUI
import WebKit

protocol NavigationProtocol : AnyObject{
    var mediator: Mediator{ get }
    
    //    var currentURL : URL? { get set }
    //    var webViews : [WKWebView] { get set }
    //    var selectedWebView : WKWebView? { get set }
    //    var currentTitle : String? { get set }
    //    var canGoBack : Bool  { get set }
    //    var canGoForward : Bool { get set }
    //
    //    var image : UIImage? { get set }
    //    var images : [UIImage] { get set }
}

class NavigationState : NSObject, ObservableObject, NavigationProtocol{
    var mediator: Mediator
    
    //        override init() {
    //            super.init()
    //            let wv = WKWebView()
    //            wv.navigationDelegate = self
    //            webViews.append(wv)
    //            let bundlePath = Bundle.main.bundlePath
    //            let path = "file://\(bundlePath)/html/nav.html"
    //            wv.load(URLRequest(url: URL(string: path)!))
    //            selectedWebView = wv
    //        }
    
    required init(mediator: Mediator) {
        self.mediator = mediator
        super.init()
        previewImages = [image]
        //        初始化第一个webview，触发tap时会崩溃
        //        self.createNewWebView(withRequest: URLRequest(url: URL(string: "https://www.baidu.com")!))
        
        //        let wv = WKWebView()
        //        wv.navigationDelegate = self
        //        webViews.append(wv)
        //        let bundlePath = Bundle.main.bundlePath
        //        let path = "file://\(bundlePath)/html/nav.html"
        //        wv.load(URLRequest(url: URL(string: path)!))
        //        selectedWebView = wv
    }
    
    @Published var currentURL : URL?
    @Published var webViews : [WKWebView] = []
    @Published var selectedWebView : WKWebView?
    @Published var currentTitle : String?
    @Published var canGoBack : Bool = false
    @Published var canGoForward : Bool = false
    
    @Published var image : UIImage = UIImage(named: "WhiteBackground")!
    @Published var images : [UIImage] = []
    @Published var webImageListArray: [Any] = []
    @Published var imgStr : String = ""
    @Published var currentIndex : Int = 0
    @Published var isPreviewing: Bool = false
    @Published var previewImages: [UIImage] = []
    
    @discardableResult func createNewWebView(withRequest request: URLRequest) -> WKWebView {
        // js代码
        // getImages: 获取每张图片的src
        // register： 给图片注册点击事件
        let jsGetImageFunc = """
            function getImages(){
                var objs = document.getElementsByTagName('img');
                var imgSrc = '';
                for(var i=0;i<objs.length;i++){
                    imgSrc = imgSrc + objs[i].src + "+";
                };
                // alert("getImages")
                return imgSrc;
            };
            function registerImageClickAction(){
                var imgs=document.getElementsByTagName('img');
                for(var i=0;i<imgs.length;i++){
                    img=imgs[i];
                    img.onclick=function(){
                        window.location.href='image-preview:'+this.src
                    }
                }
                // alert("registerImageClickAction")
            };
            """
        // 根据JS字符串初始化WKUserScript对象
        let userScript = WKUserScript(source: jsGetImageFunc, injectionTime:.atDocumentEnd, forMainFrameOnly: true)
        let userContentController = WKUserContentController()
        userContentController.addUserScript(userScript)
        
        // 根据生成的WKUserScript对象，初始化WKWebViewConfiguration
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.userContentController = userContentController
        webConfiguration.allowsInlineMediaPlayback = true
        
        // 初始化WKWebView，传入config
        let wv = WKWebView(frame: CGRect.zero, configuration: webConfiguration)
        wv.allowsBackForwardNavigationGestures = true
        wv.allowsLinkPreview = true
        wv.navigationDelegate = self
        webViews.append(wv)
        images.append(image)
        selectedWebView = wv
        wv.load(request)
        return wv
    }
    
    
    func deleteWebView(tab: WKWebView){
        guard let idx = webViews.firstIndex(of: tab) else {
            print("noindex")
            return
        }
        if(webViews[idx] == selectedWebView){
            if(webViews.count == 1){
                navGoTo(addressInput: "about:newtab")
            }else{
                if(idx == webViews.count - 1){
                    selectedWebView = webViews[idx - 1]
                }else{
                    selectedWebView = webViews[idx + 1]
                }
                webViews.remove(at: idx)
                images.remove(at: idx)
            }
        }else{
            webViews.remove(at: idx)
            images.remove(at: idx)
        }
    }
    
    func deleteAllWebViews(){
        for wv in webViews {
            deleteWebView(tab: wv)
        }
        //        createNewWebView(withRequest: URLRequest(url: URL(string: "https://www.baidu.com")!))
    }
    
    func screenshot(){
        image = self.selectedWebView?.screenshot() ?? UIImage(ciImage: .gray)
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
            //self.currentTitle = webView.title
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
        
        if(mediator.getIsSaveHistory()!){
            if(currentURL?.absoluteString != "about:blank" && currentURL?.absoluteString != "about:newtab"){
                self.mediator.addHistory(title: currentTitle!, url: currentURL!.absoluteString)
            }
        }
        
        let tempImage = webView.screenshot()
        let idx = webViews.firstIndex(of: webView)!
        //        print(idx)
        images[idx] = tempImage!
        //        print("idx: \(idx)")
        //        images[0] = tempImage ?? UIImage(ciImage: .gray)
        webView.evaluateJavaScript("getImages()", completionHandler: { (object, error) in
            let str = String.init(describing: object!)
            self.webImageListArray = str.components(separatedBy: "+")
            print(self.webImageListArray)
        })
        webView.evaluateJavaScript("registerImageClickAction()", completionHandler: nil)
        
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if (navigationAction.request.url?.scheme == "image-preview") {
            let miu = String.init(describing: "image-preview:")
            let preview = String.init(describing: navigationAction.request.url!.absoluteString)
            let path = preview.suffix(from:(miu.index(miu.startIndex, offsetBy: 14)))
            imgStr = String(path)
            self.previewPicture()
        }
        decisionHandler(.allow)
    }
    
    func previewPicture(){
        print("previewPicture")
        self.currentIndex = 0
        for section in 0..<webImageListArray.count{
            let path = String(describing: webImageListArray[section])
            if path == imgStr{
                currentIndex = section
            }
        }
        // 启动大图查看
        self.loadImages()
        self.isPreviewing = true
    }
    
    func loadImages(){
        previewImages.removeAll()
        for idx in 0..<webImageListArray.count - 1{
            guard let url = URL(string: webImageListArray[idx] as! String) else { return }
            do {
                let data = try Data(contentsOf: url)
                let image = UIImage(data: data)
                previewImages.append(image ?? self.image)
            }catch let error as NSError {
                print(error)
            }
        }
    }
    
    //页面加载失败时调用
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error){
        print("didFail")
    }
}

//extension NavigationState : WKScriptMessageHandler{
//    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
//
//    }
//}
