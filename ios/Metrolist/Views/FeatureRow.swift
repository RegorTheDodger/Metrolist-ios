import SwiftUI

struct FeatureRow: View {
    let feature: Feature

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: feature.systemImage)
                .font(.title2)
                .foregroundColor(.accentColor)
                .frame(width: 32)

            VStack(alignment: .leading, spacing: 4) {
                Text(feature.title)
                    .font(.headline)

                Text(feature.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                if let note = feature.availabilityNote {
                    Text(note)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    FeatureRow(feature: .downloads)
        .padding()
}
