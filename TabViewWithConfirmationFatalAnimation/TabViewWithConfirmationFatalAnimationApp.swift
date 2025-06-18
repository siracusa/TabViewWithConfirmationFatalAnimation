//
//  TabViewWithConfirmationFatalAnimationApp.swift
//  TabViewWithConfirmationFatalAnimation
//
//  Created by Developer on 6/18/25.
//

import SwiftUI

@main
struct TabViewWithConfirmationFatalAnimationApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(width: 400, height: 250, alignment: .top)
        }
        .windowResizability(.contentSize)

        Settings {
            SettingsView()
        }
    }
}
