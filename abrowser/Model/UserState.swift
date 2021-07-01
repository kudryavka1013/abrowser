//
//  UserState.swift
//  abrowser
//
//  Created by YJY on 2021/7/1.
//

import SwiftUI

class UserState : NSObject, ObservableObject {
    
    @Published var isLogin: Bool = false
    @Published var username: String = ""
    @Published var userphone: String  = ""
    @Published var email: String  = ""
    
}
