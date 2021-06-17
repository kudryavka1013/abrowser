//
//  BookmarkView.swift
//  abrowser
//
//  Created by 李兴利 on 2021/6/4.
//

import SwiftUI
//struct DestinationPageView: View {
//    var color: Color
//    var body: some View {
//        Text("Destination Page")
//            .font(.title)
//            .foregroundColor(color)
//    }
//}





struct BookmarkView: View {
    @ObservedObject var navigationState : NavigationState
    @ObservedObject var bookmarkState : BookmarkState
    @Binding var isPresented : Bool
        
    @State var isEditing = false
    
    func deleteRow (at offsets:IndexSet){
        print("删除");
    }
    
    var body: some View {
        BookmarkCellView(navigationState: navigationState, isPresented: $isPresented, isEditing: $isEditing, data: bookmarkState.data)
    }
    
    
}




//struct BookmarkView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookmarkView()
//    }
//}
