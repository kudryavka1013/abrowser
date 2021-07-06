//
//  abrowserApp.swift
//  abrowser
//
//  Created by 李兴利 on 2021/5/31.
//

import SwiftUI

@main
struct abrowserApp: App {
    @Environment(\.scenePhase) var scenePhase

    var mediator = Mediator()
    @ObservedObject var userPreferences : UserPreferences
    @ObservedObject var userState : UserState
    @ObservedObject var navigationState : NavigationState
    @ObservedObject var bookmarkState : BookmarkState
    @ObservedObject var historyState : HistoryState
    @ObservedObject var informationState : InformationState
    init(){
        navigationState = NavigationState(mediator: mediator)
        historyState = HistoryState(mediator: mediator)
        bookmarkState = BookmarkState(mediator: mediator)
        userPreferences = UserPreferences(mediator: mediator)
        informationState = InformationState()
        userState = UserState()
        mediator.setNav(navigationState)
        mediator.setHis(historyState)
        mediator.setPref(userPreferences)
        mediator.setBook(bookmarkState)
    }
    var body: some Scene {
        
        WindowGroup {
            ContentView(userPreferences: userPreferences,userState: userState, navigationState: navigationState, bookmarkState: bookmarkState, historyState: historyState, informationState: informationState)
        }.onChange(of: scenePhase){ newScenePhase in
            switch (newScenePhase) {
            case .background:
                print("App is background")
                historyState.saveHistoryToLocal()
                bookmarkState.saveBookmarkToLocal()
            case .inactive:
                print("App is inactive")
                historyState.saveHistoryToLocal()
                bookmarkState.saveBookmarkToLocal()
            case .active:
                print("App is active")
            @unknown default:
                print("Oh - interesting: I received an unexpected new value.")
            }
        }
    }
}
