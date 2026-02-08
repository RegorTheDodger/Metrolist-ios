import SwiftUI

struct DownloadsView: View {
    private let offlineMixes = [
        "Daily Offline Mix",
        "Long Flight Mix",
        "Saved Podcasts",
        "Road Trip Queue"
    ]

    var body: some View {
        List {
            Section {
                ForEach(offlineMixes, id: \.self) { mix in
                    Label(mix, systemImage: "arrow.down.circle.fill")
                }
            } header: {
                Text("Offline Collections")
            } footer: {
                Text("Download queues use Wi-Fi rules that match the Android app.")
            }
        }
        .navigationTitle("Downloads")
    }
}

#Preview {
    NavigationStack {
        DownloadsView()
    }
}
