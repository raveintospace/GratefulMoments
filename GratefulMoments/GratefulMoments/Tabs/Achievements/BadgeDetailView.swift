//
//  BadgeDetailView.swift
//  GratefulMoments
//
//  Created by Uri on 11/12/25.
//

import SwiftUI

struct BadgeDetailView: View {

    var badge: Badge

    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                Image(badge.details.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, height: 140)

                Text(badge.details.title)
                    .font(.title)
                    .bold()

                Text(badge.details.congratulatoryMessage)
                    .font(.body)

                Spacer()

                if let timestamp = badge.timestamp {
                    Text(timestamp, style: .date)
                        .font(.caption2)
                        .bold()
                }
            }
            .padding()
            .frame(width: 320)
            .frame(minHeight: 410)
            .fixedSize()
            .multilineTextAlignment(.center)
            .foregroundStyle(.white)
            .background(badge.details.color.opacity(0.8))
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .scrollBounceBehavior(.basedOnSize)
        .defaultScrollAnchor(.center, for: .alignment)
    }
}

#if DEBUG
#Preview {
    BadgeDetailView(badge: .sample)
}

#Preview("Spanish") {
    BadgeDetailView(badge: .sample)
        .environment(\.locale, Locale(identifier: "es"))
}
#endif

/*
 A ScrollView aligns content to the top by default. Apply .defaultScrollAnchor to center the content. When the content fits in the available space, scrolling is unnecessary.
 Avoid bouncing by using .scrollBounceBehavior so the view scrolls only when there’s overflow.
 */
