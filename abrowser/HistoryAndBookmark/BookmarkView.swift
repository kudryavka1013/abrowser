//
//  BookmarkView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/4.
//

import SwiftUI

struct BookmarkView: View {
    @ObservedObject var navigationState : NavigationState
    @ObservedObject var bookmarkState : BookmarkState
    @Binding var isPresented : Bool
    
    @State var isEditing = false
    

    
    var body: some View {
        BookmarkListView(navigationState: navigationState, bookmarkState: bookmarkState, isPresented: $isPresented, isEditing: $isEditing, bookmarkList: bookmarkState.bookmarkList)
    }
    
    
}




//struct BookmarkView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookmarkView()
//    }
//}
