//
//  HexagonLayout.swift
//  GratefulMoments
//
//  Created by Uri on 10/12/25.
//

import Foundation

/// Provides sizing information for the Hexagon to support different layouts.
enum HexagonLayout {
    case standard
    case large

    var size: CGFloat {
        switch self {
        case .standard:
            return 200.0
        case .large:
            return 350.0
        }
    }
}
