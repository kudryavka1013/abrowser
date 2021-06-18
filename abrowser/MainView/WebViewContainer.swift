//
//  WebViewContainer.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/18.
//

import SwiftUI

struct WebViewContainer: UIViewControllerRepresentable{
    @ObservedObject var navigationState : NavigationState
    func makeUIViewController(context: Context) -> UIViewController {
        let vc = UIViewController()
        print("make WebViewContainer")
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        print("update WebViewContainer")
        return
    }
    
    typealias UIViewControllerType = UIViewController
    
    
}

//struct WebViewContainer_Previews: PreviewProvider {
//    static var previews: some View {
//        WebViewContainer()
//    }
//}
