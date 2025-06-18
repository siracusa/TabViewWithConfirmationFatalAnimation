//
//  ContentView.swift
//  TabViewWithConfirmationFatalAnimation
//
//  Created by Developer on 6/18/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.openSettings) var openSettings

    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .foregroundStyle(.tint)
                .frame(width: 48, height: 48)
                .padding()

            Text("Open Settings, then change tabs in the Settings window to trigger a fatal error.")

            Button("Open Settings") {
                openSettings()
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
