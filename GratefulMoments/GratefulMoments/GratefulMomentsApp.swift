//
//  GratefulMomentsApp.swift
//  GratefulMoments
//  https://developer.apple.com/tutorials/develop-in-swift#views-and-data-storage
//  Created by Uri on 10/12/25.
//

import SwiftUI
import SwiftData

@main
struct GratefulMomentsApp: App {
    let dataContainer = DataContainer()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataContainer)
        }
        .modelContainer(dataContainer.modelContainer)
    }
}
