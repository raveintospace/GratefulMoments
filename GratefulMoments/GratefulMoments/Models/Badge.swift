//
//  Badge.swift
//  GratefulMoments
//
//  Created by Uri on 11/12/25.
//

import Foundation
import SwiftData

/// Badges owned by user
@Model
class Badge {
    var details: BadgeDetails

    init(details: BadgeDetails) {
        self.details = details
    }
}

extension Badge {
    static var sample: Badge {
        let badge = Badge(details: .firstEntry)
        return badge
    }
}
