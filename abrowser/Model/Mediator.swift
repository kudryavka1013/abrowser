//
//  Mediator.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/23.
//

import SwiftUI

protocol StateProtocol {
    var mediator : Mediator { get }
    init(mediator : Mediator)
    
//    func operation()
}

final class Mediator{
    var navigationState : StateProtocol?
    var bookmarkState : StateProtocol?
    var historyState : StateProtocol?
    var userPreferences : StateProtocol?
    
//    func addHistory(title: String,url: String){
//        historyState?.addhistory(newtitle: title, newUrl: url)
//    }
}

class n : StateProtocol{
    var mediator: Mediator
    
    required init(mediator: Mediator) {
        self.mediator = mediator
    }
    
    func operation() {
        print("n")
    }
    
}

class h : StateProtocol{
    var mediator: Mediator
    
    required init(mediator: Mediator) {
        self.mediator = mediator
    }
    
    func operation() {
        print("h")
    }
    
}
