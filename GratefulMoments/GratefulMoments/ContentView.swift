//
//  ContentView.swift
//  GratefulMoments
//
//  Created by Uri on 10/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Moments", image: "MomentsTab") {
                MomentsView()
            }
            Tab("Achievements", systemImage: "medal.fill") {
                AchievementsView()
            }
        }
    }
}

#if DEBUG
#Preview {
    ContentView()
        .sampleDataContainer()
}
#endif
