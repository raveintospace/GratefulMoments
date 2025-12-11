//
//  AchievementsView.swift
//  GratefulMoments
//
//  Created by Uri on 11/12/25.
//

import SwiftUI
import SwiftData

struct AchievementsView: View {

    @Query(filter: #Predicate<Badge> { $0.timestamp != nil }) private var unlockedBadges: [Badge]
    @Query(filter: #Predicate<Badge> { $0.timestamp == nil }) private var lockedBadges: [Badge]
    @Query(sort: \Moment.timestamp) private var moments: [Moment]

    var body: some View {
        NavigationStack {
            ScrollView {
                contentStack
            }
            .navigationTitle("Achievements")
        }
    }
}

#if DEBUG
#Preview {
    AchievementsView()
        .sampleDataContainer()
}
#endif

extension AchievementsView {

    private var contentStack: some View {
        VStack(alignment: .leading) {
            StreakView(numberOfDays: StreakCalculator().calculateStreak(for: moments))
                .frame(maxWidth: .infinity)

            if !unlockedBadges.isEmpty {
                header("Your Badges")

                ScrollView(.horizontal) {
                    HStack {
                        ForEach(sortedUnlockedBadges) { badge in
                            UnlockedBadgeView(badge: badge)
                        }
                    }
                }
                .scrollClipDisabled()
                .scrollIndicators(.hidden)
            }

            if !lockedBadges.isEmpty {
                header("Locked Badges")
                ForEach(sortedLockedBadges) { badge in
                    LockedBadgeView(badge: badge)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }

    private var sortedLockedBadges: [Badge] {
        lockedBadges.sorted {
            $0.details.rawValue < $1.details.rawValue
        }
    }

    /// Precondition: Unlocked badges must have a timestamp
    private var sortedUnlockedBadges: [Badge] {
        unlockedBadges.sorted {
            ($0.timestamp!, $0.details.title) < ($1.timestamp!, $1.details.title)
        }
    }

    private func header(_ text: String) -> some View {
        Text(text)
            .font(.subheadline)
            .bold()
            .padding()
    }
}
