//
//  MomentHexagonView.swift
//  GratefulMoments
//
//  Created by Uri on 10/12/25.
//

import SwiftUI

/// Displays moment data inside a Hexagon
struct MomentHexagonView: View {

    var moment: Moment
    @State var layout: HexagonLayout = .standard

    var body: some View {
        Hexagon(moment: moment, layout: layout) {
            Text("Hello, World!")
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
#endif
