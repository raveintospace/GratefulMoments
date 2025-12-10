//
//  MomentDetailView.swift
//  GratefulMoments
//
//  Created by Uri on 10/12/25.
//

import SwiftUI
import SwiftData

struct MomentDetailView: View {

    var moment: Moment

    @State private var showConfirmation = false

    @Environment(DataContainer.self) private var dataContainer
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            contentStack
        }
        .navigationTitle(moment.title)
        .toolbar {
            ToolbarItem(placement: .destructiveAction) {
                Button {
                    showConfirmation = true
                } label: {
                    Image(systemName: "trash")
                }
                .confirmationDialog("Delete Moment", isPresented: $showConfirmation) {
                    Button("Delete Moment", role: .destructive) {
                        dataContainer.context.delete(moment)
                        try? dataContainer.context.save()
                        dismiss()
                    }
                } message: {
                    Text("The moment will be permanently deleted. Earned badges won't be removed.")
                }
            }
        }
    }
}

#if DEBUG
#Preview {
    NavigationStack {
        MomentDetailView(moment: .imageSample)
            .sampleDataContainer()
    }
}
#endif

extension MomentDetailView {

    private var contentStack: some View {
        VStack(alignment: .leading) {
            Text(moment.timestamp, style: .date)
                .font(.subheadline)

            if !moment.note.isEmpty {
                Text(moment.note)
                    .textSelection(.enabled) // allows press and hold to copy text
            }

            if let image = moment.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}
