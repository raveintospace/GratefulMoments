//
//  Hexagon.swift
//  GratefulMoments
//
//  Created by Uri on 10/12/25.
//

import SwiftUI

struct Hexagon<Content: View>: View {

    var moment: Moment? = nil
    var size: CGFloat = 350
    private let borderWidth = 2.0
    var borderColor: Color = .ember

    @ViewBuilder var content: () -> Content

    var body: some View {
        ZStack {
            if let background = moment?.image {
                Image(uiImage: background)
                    .resizable()
                    .scaledToFit()
            }

            content()
                .frame(width: size, height: size)
        }
        .mask {
            Image(systemName: "hexagon.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size - borderWidth, height: size - borderWidth)
        }
        .background {
            Image(systemName: "hexagon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size, height: size)
                .foregroundStyle(borderColor)
        }
        .frame(width: size, height: size)
    }
}

#if DEBUG
#Preview {
    Hexagon(moment: Moment.imageSample) {
        Text(Moment.imageSample.title)
            .foregroundStyle(Color.white)
    }
    .sampleDataContainer()
}
#endif


// Text(Moment.imageSample.title) = content()
