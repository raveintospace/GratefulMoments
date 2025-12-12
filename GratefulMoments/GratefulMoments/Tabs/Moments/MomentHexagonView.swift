//
//  MomentHexagonView.swift
//  GratefulMoments
//
//  Created by Uri on 10/12/25.
//

import SwiftUI

/// Displays moment data inside a Hexagon
struct MomentHexagonView: View {

    @Environment(\.locale) private var locale

    var moment: Moment
    @State var layout: HexagonLayout = .standard

    var body: some View {
        Hexagon(moment: moment, layout: layout) {
            hexagonContent()
        }
    }
}

#if DEBUG
#Preview {
    ScrollView {
        MomentHexagonView(moment: Moment.imageSample)
        MomentHexagonView(moment: Moment.imageSample, layout: .large)
        MomentHexagonView(moment: Moment.sample)
        MomentHexagonView(moment: Moment.sample, layout: .large)
    }
}

#Preview("Spanish") {
    MomentHexagonView(moment: Moment.imageSample)
        .environment(\.locale, Locale(identifier: "es"))
}

#Preview("English - GB") {
    MomentHexagonView(moment: Moment.imageSample)
        .environment(\.locale, Locale(identifier: "en_GB"))
}
#endif

extension MomentHexagonView {

    private func hexagonContent() -> some View {
        ZStack(alignment: .bottom) {
            if showImage {
                Color.clear
                contentStack()
                    .frame(maxWidth: .infinity)
                    .padding(.top, 8)
                    .background(.ultraThinMaterial)
            } else {
                Color.ember
                contentStack()
                    .frame(height: layout.size * 0.80)
            }

            Text(moment.timestamp.formatted(
                .dateTime.locale(locale)
                .month(.abbreviated).day()
            ))
            .font(.footnote)
            .padding(.bottom, layout.size * 0.08)
            .frame(maxWidth: layout.size / 3)
            .frame(maxHeight: layout.timestampHeight)
        }
        .foregroundStyle(.white)
    }

    private func contentStack() -> some View {
        VStack(alignment: .leading) {
            Text(moment.title)
                .font(layout.titleFont)

            if !moment.note.isEmpty, !showImage {
                Text(moment.note)
                    .font(layout.bodyFont)
            }
        }
        .frame(maxWidth: layout.size * 0.80)
        .frame(maxHeight: layout.size * (showImage ? 0.15 : 0.50))
        .padding(.bottom, layout.size * layout.textBottomPadding)
        .fixedSize(horizontal: false, vertical: true) // the content determines the view’s height, removing extra vertical space.
    }

    private var showImage: Bool {
        moment.image != nil
    }
}
