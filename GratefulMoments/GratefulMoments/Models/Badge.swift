//
//  Badge.swift
//  GratefulMoments
//
//  Created by Uri on 11/12/25.
//

import Foundation
import SwiftData

/// Badges owned by user
/// Use `timestamp` to determine if a badge is unlocked.
/// A `Moment` may be deleted but the timestamp stays.
/// Once awarded, badges aren't relocked.
@Model
class Badge {
    var details: BadgeDetails
    var moment: Moment?
    var timestamp: Date?

    init(details: BadgeDetails) {
        self.details = details
        self.moment = nil
        self.timestamp = nil
    }
}

extension Badge {
    static var sample: Badge {
        let badge = Badge(details: .firstEntry)
        badge.timestamp = .now
        return badge
    }
}

/*
 Badges are created on app launch and only assigned to a moment later, therefore we don't include them on init
 */
