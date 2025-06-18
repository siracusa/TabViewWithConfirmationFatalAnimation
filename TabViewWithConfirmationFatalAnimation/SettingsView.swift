//
//  SettingsView.swift
//  TabViewWithConfirmationFatalAnimation
//
//  Created by Developer on 6/18/25.
//

import SwiftUI

public enum SectionTab : Int {
    case general = 0
    case interface = 1
}

struct SettingsView : View {
    @State private var selectedTab : SectionTab = .general

    @State private var showingConfirmation = false

    var body: some View {
        TabView(selection: $selectedTab.animation()) {
            Tab("General", systemImage: "gearshape", value: SectionTab.general) {

                Rectangle()
                    .foregroundStyle(.blue)
                    .frame(height: 400)
            }

            Tab("Interface", systemImage: "macwindow.on.rectangle", value: SectionTab.interface) {

                Rectangle()
                    .foregroundStyle(.green)
                    .frame(height: 800)
            }
        }
        // BUG EXPLANATION
        //
        // The existence of this .confirmationDialog() modifier causes an
        // (effectively) fatal error when changing tabs in the TabView if
        // the .animation() modifier is applied to $selectedTab above.
        .confirmationDialog("Confirm?", isPresented: $showingConfirmation) {
            Button("Confirm") { }
            Button("Cancel", role: .cancel) { }
        }
        message: {
            Text("Confirm the thing?")
        }
    }
}

#Preview {
    SettingsView()
}
