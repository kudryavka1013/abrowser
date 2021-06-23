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

    @StateObject var userPreferences = UserPreferences()
    @StateObject var navigationState = NavigationState()
    @StateObject var bookmarkState = BookmarkState()
    @StateObject var historyState = HistoryState()
    
    var body: some Scene {
        
        WindowGroup {
            ContentView(userPreferences: userPreferences, navigationState: navigationState, bookmarkState: bookmarkState, historyState: historyState)
        }.onChange(of: scenePhase){ newScenePhase in
            switch (newScenePhase) {
            case .background:
                historyState.saveHistoryToLocal()
                bookmarkState.saveBookmarkToLocal()
            case .inactive:
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
