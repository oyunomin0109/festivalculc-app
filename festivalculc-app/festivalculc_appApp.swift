//
//  festivalculc_appApp.swift
//  festivalculc-app
//
//  Created by oyunomin on 2023/08/25.
//

import SwiftUI
@main
struct festivalculc_appApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AppManager())
        }
    }
}
