//
//  BadgeManager.swift
//  GratefulMoments
//
//  Created by Uri on 11/12/25.
//

import Foundation
import SwiftData

/// Responsible for storing badges in SwiftData and awarding badges when their requirements are met.
class BadgeManager {
    private let modelContainer: ModelContainer

    init(modelContainer: ModelContainer) {
        self.modelContainer = modelContainer
    }

    func loadBadgesIfNeeded() throws {
        let context = modelContainer.mainContext

        /// Define the type of data to fetch.
        /// It can filter, sort and limit the number of results
        var fetchDescriptor = FetchDescriptor<Badge>()
        fetchDescriptor.fetchLimit = 1
        let existingBadges = try context.fetch(fetchDescriptor)

        if existingBadges.isEmpty {
            for details in BadgeDetails.allCases {
                context.insert(Badge(details: details))
            }
        }
    }
}
