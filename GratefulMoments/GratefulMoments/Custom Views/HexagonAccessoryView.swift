//
//  HexagonAccessoryView.swift
//  GratefulMoments
//
//  Created by Uri on 11/12/25.
//

import SwiftUI

struct HexagonAccessoryView: View {

    let moment: Moment
    let hexagonLayout: HexagonLayout

    var body: some View {
        NavigationLink {
            if badges.count == 1 {
                BadgeDetailView(badge: badges[0])
            } else {
                MomentDetailView(moment: moment)
            }
        } label: {
            badgeView
        }
    }
}

#if DEBUG
#Preview("Single Badge") {
    HexagonAccessoryView(moment: .sample, hexagonLayout: .large)
        .sampleDataContainer()
}

#Preview("Multiple badges") {
    HexagonAccessoryView(moment: .imageSample, hexagonLayout: .large)
        .sampleDataContainer()
}
#endif

extension HexagonAccessoryView {

    private var badges: [Badge] {
        moment.badges
    }

    /// 20% of parent size
    private var size: CGFloat {
        hexagonLayout.size / 5
    }

    /// The y offset of the accessory view to align with the top-right corner of the hexagon.
    private var yOffset: CGFloat {
        let radius = hexagonLayout.size / 2
        let yOffsetFromHexagonCenter = sin(Angle.degrees(30).radians) * radius
        return radius - yOffsetFromHexagonCenter - (size / 2)
    }

    private var badgeView: some View {
        Group {
            if badges.count > 1 {
                Text("+\(badges.count)")
                    .bold()
                    .frame(width: size * 0.5, height: size * 0.5)
                    .padding(8)
                    .background {
                        Image("blank")
                            .resizable()
                            .frame(width: size, height: size)
                            .shadow(radius: 2)
                    }
                    .foregroundStyle(.gray)

            } else if let badge = badges.first {
                Image(badge.details.image)
                    .resizable()
                    .frame(width: size, height: size)
                    .shadow(radius: 2)
            }
        }
        .offset(y: yOffset)
    }
}
